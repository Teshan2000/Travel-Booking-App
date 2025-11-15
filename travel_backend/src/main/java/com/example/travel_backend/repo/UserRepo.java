package com.postgresql.user_auth.repo;

import com.postgresql.user_auth.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepo extends JpaRepository<User, long> {
    Optional <User> findByUsername(String username);
}
