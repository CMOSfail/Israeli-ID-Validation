function isValidIsraeliID($id) {
    // Add leading zeroes if ID is less than 9 digits
    $id = str_pad($id, 9, '0', STR_PAD_LEFT);

    // Convert ID to array of integers
    $idArr = str_split($id);

    // Multiply first 8 digits by check array
    $checkArr = [1, 2, 1, 2, 1, 2, 1, 2];
    $calcArr = array_slice($idArr, 0, 8);
    for ($i=0; $i < 8; $i++) { 
        $calcArr[$i] = $calcArr[$i] * $checkArr[$i];
    }

    // Calculate sum of resulting array
    $sum = array_reduce($calcArr, function($acc, $val) {
        return $val > 9 ? $acc + ($val % 10) + 1 : $acc + $val;
    }, 0);

    // Calculate check digit
    $checkDigit = (10 - ($sum % 10)) % 10;

    // Compare check digit with last digit of ID
    return $idArr[8] === $checkDigit;
}
