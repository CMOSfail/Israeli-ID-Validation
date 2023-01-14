#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool is_valid_israeli_id(const char* id) {
    // Add leading zeroes if ID is less than 9 digits
    char id_padded[10];
    snprintf(id_padded, sizeof id_padded, "%09d", atoi(id));

    // Convert ID to array of integers
    int id_arr[9];
    for (int i = 0; i < 9; i++) {
        id_arr[i] = id_padded[i] - '0';
    }

    // Multiply first 8 digits by check array
    int check_arr[] = {1, 2, 1, 2, 1, 2, 1, 2};
    int calc_arr[8];
    for (int i = 0; i < 8; i++) {
        calc_arr[i] = id_arr[i] * check_arr[i];
    }

    // Calculate sum of resulting array
    int sum = 0;
    for (int i = 0; i < 8; i++) {
        sum += calc_arr[i] > 9 ? calc_arr[i] - 9 : calc_arr[i];
    }

    // Calculate check digit
    int check_digit = (10 - (sum % 10)) % 10;

    // Compare check digit with last digit of ID
    return id_arr[8] == check_digit;
}
