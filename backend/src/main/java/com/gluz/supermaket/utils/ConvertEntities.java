package com.gluz.supermaket.utils;

public interface ConvertEntities<T , J> {
    public  J convertToEntity(T dto);
    public T convertToDTO(J entity);
}
