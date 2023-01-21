class IsraeliIdValidation {
    static boolean isValid(id) {
        id = id.padLeft(9, '0')
        idArr = id.split('').collect { it.toInteger() }
        checkArr = [1, 2, 1, 2, 1, 2, 1, 2]
        calcArr = (0..7).collect { idArr[it] * checkArr[it] }
        sum = calcArr.inject(0) { sum, val -> sum + (val > 9 ? val - 9 : val) }
        checkDigit = (10 - (sum % 10)) % 10
        idArr[8] == checkDigit
    }
}
