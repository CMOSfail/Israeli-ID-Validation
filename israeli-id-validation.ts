function isValidIsraeliID(id: string): boolean {
    // Add leading zeroes if ID is less than 9 digits
    id = id.padStart(9, "0");

    // Convert ID to array of integers
    const id_arr = id.split("").map((i) => parseInt(i));

    // Multiply first 8 digits by check array
    const check_arr = [1, 2, 1, 2, 1, 2, 1, 2];
    const calc_arr = id_arr.slice(0, 8).map((val, i) => val * check_arr[i]);

    // Calculate sum of resulting array
    const sum = calc_arr.reduce((acc, val) => acc + (val > 9 ? val - 9 : val), 0);

    // Calculate check digit
    const check_digit = (10 - (sum % 10)) % 10;

    // Compare check digit with last digit of ID
    return id_arr[8] === check_digit;
}
