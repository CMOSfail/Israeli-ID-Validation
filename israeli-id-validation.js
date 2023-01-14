function isValidIsraeliID(id) {
    // Add leading zeroes if ID is less than 9 digits
    id = id.toString().padStart(9, '0');

    // Convert ID to array of integers
    const idArr = id.split('').map(Number);

    // Multiply first 8 digits by check array
    const checkArr = [1, 2, 1, 2, 1, 2, 1, 2];
    const calcArr = idArr.slice(0, 8).map((digit, i) => digit * checkArr[i]);

    // Calculate sum of resulting array
    const sum = calcArr.reduce((acc, val) => (val > 9 ? acc + (val % 10) + 1 : acc + val), 0);

    // Calculate check digit
    const checkDigit = (10 - (sum % 10)) % 10;

    // Compare check digit with last digit of ID
    return idArr[8] === checkDigit;
}