fun isValidIsraeliID(id: String): Boolean {
    // Add leading zeroes if ID is less than 9 digits
    val id = id.padStart(9, '0')

    // Convert ID to array of integers
    val id_arr = id.map { it.toString().toInt() }.toIntArray()

    // Multiply first 8 digits by check array
    val check_arr = intArrayOf(1, 2, 1, 2, 1, 2, 1, 2)
    val calc_arr = IntArray(8) { id_arr[it] * check_arr[it] }

    // Calculate sum of resulting array
    val sum = calc_arr.sumBy { if (it > 9) it - 9 else it }

    // Calculate check digit
    val check_digit = (10 - (sum % 10)) % 10

    // Compare check digit with last digit of ID
    return id_arr[8] == check_digit
}
