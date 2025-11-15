package com.postgresql.user_auth.controller;

import com.postgresql.user_auth.model.User;
import com.postgresql.user_auth.repo.UserRepository;
import com.postgresql.user_auth.security.JwtUtil;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("api/auth")

public class AuthController {
    private final UserRepository userRepo;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public AuthController(UserRepository userRepo, PasswordEncoder passwordEncoder, JwtUtil jwtUtil) {
        this.userRepo = userRepo;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = new JwtUtil();

        @PostMapping("/register")
        public Map<String, String> register(@RequestBody User user) {
            System.out.println("Received user: " + user.getUsername());
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepo.save(user);
            return Map.of("message", "User registered successfully");
        }

        @PostMapping("/login")
        public Map<String, String> login(@RequestBody Map<String, String> loginData) {
            String username = loginData.get("username");    
            String password = loginData.get("password");

            User user = userRepo.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

            if (!passwordEncoder.matches(password, user.getPassword())) {
                throw new RuntimeException("Invalid credentials");
            }

            String accessToken = jwtUtil.generateToken(username);
            String refreshToken = jwtUtil.generateToken(username);

            return Map.of(
                "accessToken", accessToken,
                "refreshToken", refreshToken
            );
        }
    }
}
