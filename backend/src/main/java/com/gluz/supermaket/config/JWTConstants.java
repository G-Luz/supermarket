package com.gluz.supermaket.config;

public class JWTConstants {
    public static final String SECRET = "SECRET_KEY";
    public static final long EXPIRATION_TIME = 43200000 ; // 12 hours
    public static final String TOKEN_PREFIX = "Bearer ";
    public static final String HEADER_STRING = "Authorization";
    public static final String SIGN_UP_URL = "/signup";
    public static final String USERS_URL = "/v1/users";
    public static final String SIGN_IN_URL = "/login";


}
