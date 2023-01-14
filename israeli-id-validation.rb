def is_valid_israeli_id(id)
    # Add leading zeroes if ID is less than 9 digits
    id = id.rjust(9, "0")
  
    # Convert ID to array of integers
    id_arr = id.split("").map(&:to_i)
  
    # Multiply first 8 digits by check array
    check_arr = [1, 2, 1, 2, 1, 2, 1, 2]
    calc_arr = id_arr[0...8].map.with_index { |d, i| d * check_arr[i] }
  
    # Calculate sum of resulting array
    sum = calc_arr.inject(0) { |acc, val| val > 9 ? acc + val - 9 : acc + val }
  
    # Calculate check digit
    check_digit = (10 - (sum % 10)) % 10
  
    # Compare check digit with last digit of ID
    id_arr[8] == check_digit
  end  