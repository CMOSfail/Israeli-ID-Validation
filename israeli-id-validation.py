def is_valid_israeli_id(id: str) -> bool:
    # Add leading zeroes if ID is less than 9 digits
    id = id.zfill(9)

    # Convert ID to array of integers
    id_arr = [int(i) for i in id]

    # Multiply first 8 digits by check array
    check_arr = [1, 2, 1, 2, 1, 2, 1, 2]
    calc_arr = [id_arr[i] * check_arr[i] for i in range(8)]

    # Calculate sum of resulting array
    sum = sum(val - 9 if val > 9 else val for val in calc_arr)

    # Calculate check digit
    check_digit = (10 - (sum % 10)) % 10

    # Compare check digit with last digit of ID
    return id_arr[8] == check_digit

