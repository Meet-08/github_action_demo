package com.meet.githubactiondemo.service;

import com.meet.githubactiondemo.models.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    List<User> userRepo = new ArrayList<>();

    UserService() {
        for (int i = 1; i <= 10; i++)
            userRepo.add(new User("User" + i, "user" + i + "@example.com"));
    }

    public List<User> getAllUsers() {
        return userRepo;
    }
}
