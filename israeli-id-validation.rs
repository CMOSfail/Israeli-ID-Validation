fn is_valid_israeli_id(id: &str) -> bool {
    // Add leading zeroes if ID is less than 9 digits
    let id = format!("{:09}", id);

    // Convert ID to array of integers
    let id_arr: Vec<i32> = id.chars().map(|c| c.to_digit(10).unwrap() as i32).collect();

    // Multiply first 8 digits by check array
    let check_arr = [1, 2, 1, 2, 1, 2, 1, 2];
    let mut calc_arr = vec![0; 8];
    for i in 0..8 {
        calc_arr[i] = id_arr[i] * check_arr[i];
    }

    // Calculate sum of resulting array
    let sum = calc_arr.iter().map(|&val| if val > 9 { val - 9 } else { val }).sum();

    // Calculate check digit
    let check_digit = (10 - (sum % 10)) % 10;

    // Compare check digit with last digit of ID
    id_arr[8] == check_digit
}
