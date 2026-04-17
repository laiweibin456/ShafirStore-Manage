package com.shafir.store.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/dev")
@RequiredArgsConstructor
public class DevController {

    private final PasswordEncoder passwordEncoder;

    @GetMapping("/encode-password")
    public String encodePassword(@RequestParam String password) {
        String encoded = passwordEncoder.encode(password);
        return "原始密码: " + password + "\n加密后: " + encoded + "\n\nSQL更新语句:\nUPDATE sys_user SET password = '" + encoded + "' WHERE username = 'admin';";
    }
}
