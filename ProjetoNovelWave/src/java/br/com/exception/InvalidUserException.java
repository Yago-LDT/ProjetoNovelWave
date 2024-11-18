package br.com.exception;

import javax.servlet.ServletException;

public class InvalidUserException extends ServletException{
    public InvalidUserException(String message){
        super(message);
    }
}
