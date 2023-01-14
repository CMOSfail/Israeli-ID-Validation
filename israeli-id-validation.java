public class IDValidator {
    public static boolean isValidIsraeliID(String id) {
        // Add leading zeroes if ID is less than 9 digits
        id = String.format("%09d", Integer.parseInt(id));

        // Convert ID to array of integers
        int[] idArr = id.chars().map(Character::getNumericValue).toArray();

        // Multiply first 8 digits by check array
        int[] checkArr = {1, 2, 1, 2, 1, 2, 1, 2};
        int[] calcArr = new int[8];
        for (int i = 0; i < 8; i++) {
            calcArr[i] = idArr[i] * checkArr[i];
        }

        // Calculate sum of resulting array
        int sum = 0;
        for (int val : calcArr) {
            sum += val > 9 ? val - 9 : val;
        }

        // Calculate check digit
        int checkDigit = (10 - (sum % 10)) % 10;

        // Compare check digit with last digit of ID
        return idArr[8] == checkDigit;
    }
}
