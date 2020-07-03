package com.atguigu.springtest;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptTest {

    @Test
    public void test1(){
        BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
        //$2a$10$m7ly0V6ItBNBmzoheALVfOwob.i1Fo86nwW3kJ6munzVIWZbgPdvm
        String encode = bc.encode("123456");
        System.out.println("encode = " + encode);
        boolean matches = bc.matches("123456", "$2a$10$m7ly0V6ItBNBmzoheALVfOwob.i1Fo86nwW3kJ6munzVIWZbgPdvm");
        System.out.println("matches = " + matches);
    }
}
