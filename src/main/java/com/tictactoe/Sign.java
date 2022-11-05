package com.tictactoe;

public enum Sign {
    // Sign – enum, который отвечает за “крестик/нолик/пустота”.
    EMPTY(' '),
    CROSS('X'),
    NOUGHT('0');

    private final char sign;

    Sign(char sign) {
        this.sign = sign;
    } // конструктор

    public char getSign() {
        return sign;
    } // получить поле sign
}