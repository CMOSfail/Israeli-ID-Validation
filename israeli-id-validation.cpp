#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

bool isValidIsraeliID(std::string id) {
    // Add leading zeroes if ID is less than 9 digits
    id.insert(0, 9 - id.length(), '0');

    // Convert ID to array of integers
    std::vector<int> idArr(id.length());
    std::transform(id.begin(), id.end(), idArr.begin(), [](unsigned char c) { return c - '0'; });

    // Multiply first 8 digits by check array
    int checkArr[] = {1, 2, 1, 2, 1, 2, 1, 2};
    std::vector<int> calcArr(8);
    for (int i = 0; i < 8; i++) {
        calcArr[i] = idArr[i] * checkArr[i];
    }

    // Calculate sum of resulting array
    int sum = 0;
    for (int i = 0; i < 8; i++) {
        sum += calcArr[i] > 9 ? calcArr[i] - 9 : calcArr[i];
    }

    // Calculate check digit
    int checkDigit = (10 - (sum % 10)) % 10;

    // Compare check digit with last digit of ID
    return idArr[8] == checkDigit;
}
