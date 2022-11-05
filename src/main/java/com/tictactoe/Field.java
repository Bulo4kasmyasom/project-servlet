package com.tictactoe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Field {
    // игровое поле
    private final Map<Integer, Sign> field; // коллекция ячеек

    public Field() {
        // конструктор
        field = new HashMap<>();
        field.put(0, Sign.EMPTY);
        field.put(1, Sign.EMPTY);
        field.put(2, Sign.EMPTY);
        field.put(3, Sign.EMPTY);
        field.put(4, Sign.EMPTY);
        field.put(5, Sign.EMPTY);
        field.put(6, Sign.EMPTY);
        field.put(7, Sign.EMPTY);
        field.put(8, Sign.EMPTY);
    }

    public Map<Integer, Sign> getField() {
        return field;
    } // получить поле

    public int getEmptyFieldIndex() {
        // ищет первую незанятую ячейку

        return field.entrySet().stream()
                .filter(e -> e.getValue() == Sign.EMPTY)
                .map(Map.Entry::getKey)
                .findFirst().orElse(-1);
    }

    public List<Sign> getFieldData() {
        // возвращает значения мапы “field” в виде списка,
        // отсортированного в порядке возрастания индексов.
        return field.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());
    }

    public Sign checkWin() {
        // проверяет не завершена ли игра.
        // Если есть ряд из трех крестиков – возвращает крестик,
        // если из трех ноликов – нолик. Иначе – пустоту.
        List<List<Integer>> winPossibilities = List.of(
                List.of(0, 1, 2),
                List.of(3, 4, 5),
                List.of(6, 7, 8),
                List.of(0, 3, 6),
                List.of(1, 4, 7),
                List.of(2, 5, 8),
                List.of(0, 4, 8),
                List.of(2, 4, 6)
        );

        // Каждый list списка winPossibilities проверяем
        // если 0-вой элемент = 2-му и 0-вой = 3-му, то игра считается завершённой
        // возвращаем символ из этого list
        for (List<Integer> winPossibility : winPossibilities) {
            if (field.get(winPossibility.get(0)) == field.get(winPossibility.get(1))
                && field.get(winPossibility.get(0)) == field.get(winPossibility.get(2))) {
                return field.get(winPossibility.get(0));
            }
        }
        // иначе возвращаем пусто
        return Sign.EMPTY;
    }
}