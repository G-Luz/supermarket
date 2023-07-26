package com.gluz.supermaket.utils;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class Response<T> {

    int code;
    String message;
    T data;

}
