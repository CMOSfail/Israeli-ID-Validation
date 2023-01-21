sub is_valid_israeli_id {
    my $id = shift;

    # Add leading zeroes if ID is less than 9 digits
    $id = sprintf("%09d", $id);

    # Convert ID to array of integers
    my @id_arr = split(//, $id);

    # Multiply first 8 digits by check array
    my @check_arr = (1, 2, 1, 2, 1, 2, 1, 2);
    my @calc_arr = map { $id_arr[$_] * $check_arr[$_] } (0..7);

    # Calculate sum of resulting array
    my $sum = 0;
    $sum += $_ > 9 ? $_ - 9 : $_ for @calc_arr;

    # Calculate check digit
    my $check_digit = (10 - ($sum % 10)) % 10;

    # Compare check digit with last digit of ID
    return $id_arr[8] == $check_digit;
}
