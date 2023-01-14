func isValidIsraeliID(_ id: String) -> Bool {
    // Add leading zeroes if ID is less than 9 digits
    let id = String(format: "%09d", Int(id)!)

    // Convert ID to array of integers
    let idArr = id.map { Int(String($0))! }

    // Multiply first 8 digits by check array
    let checkArr = [1, 2, 1, 2, 1, 2, 1, 2]
    let calcArr = idArr[0..<8].enumerated().map { $0.element * checkArr[$0.offset] }

    // Calculate sum of resulting array
    let sum = calcArr.reduce(0) { $0 + ($1 > 9 ? $1 - 9 : $1) }

    // Calculate check digit
    let checkDigit = (10 - (sum % 10)) % 10

    // Compare check digit with last digit of ID
    return idArr[8] == checkDigit
}
