package main

import (
    "fmt"
    "strconv"
)

func isValidIsraeliID(id string) bool {
    // Add leading zeroes if ID is less than 9 digits
    id = fmt.Sprintf("%09s", id)

    // Convert ID to array of integers
    idArr := make([]int, 9)
    for i := 0; i < 9; i++ {
        idArr[i], _ = strconv.Atoi(string(id[i]))
    }

    // Multiply first 8 digits by check array
    checkArr := [8]int{1, 2, 1, 2, 1, 2, 1, 2}
    var calcArr [8]int
    for i := 0; i < 8; i++ {
        calcArr[i] = idArr[i] * checkArr[i]
    }

    // Calculate sum of resulting array
    var sum int
    for _, val := range calcArr {
        if val > 9 {
            sum += val - 9
        } else {
            sum += val
        }
    }

    // Calculate check digit
    checkDigit := (10 - (sum % 10)) % 10

    // Compare check digit with last digit of ID
    return idArr[8] == checkDigit
}
