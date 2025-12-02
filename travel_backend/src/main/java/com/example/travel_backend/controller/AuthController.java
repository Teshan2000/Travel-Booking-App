package com.example.travel_backend.controller;

import com.example.travel_backend.model.User;
import com.example.travel_backend.repo.UserRepo;
import com.example.travel_backend.security.JwtUtil;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")

public class AuthController {
    private final UserRepo userRepo;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public AuthController(UserRepo userRepo, PasswordEncoder passwordEncoder, JwtUtil jwtUtil) {
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = new JwtUtil();
    }

    @PostMapping("/register")
    public Map<String, String> register(@RequestBody User user) {
        System.out.println("Received user: " + user.getEmail());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        return Map.of("message", "User registered successfully");
    }

    @PostMapping("/login")
    public Map<String, String> login(@RequestBody Map<String, String> loginData) {
        String email = loginData.get("email");    
        String password = loginData.get("password");

        User user = userRepo.findByEmail(email)
            .orElseThrow(() -> new RuntimeException("User not found"));

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Invalid credentials");
        }

        String accessToken = jwtUtil.generateToken(email);
        String refreshToken = jwtUtil.generateToken(email);

        return Map.of(
            "accessToken", accessToken,
            "refreshToken", refreshToken
        );
    }
    
}
