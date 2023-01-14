using System;
using System.Linq;

class IDValidator
{
    public static bool IsValidIsraeliID(string id)
    {
        // Add leading zeroes if ID is less than 9 digits
        id = id.PadLeft(9, '0');

        // Convert ID to array of integers
        int[] idArr = id.Select(c => int.Parse(c.ToString())).ToArray();

        // Multiply first 8 digits by check array
        int[] checkArr = { 1, 2, 1, 2, 1, 2, 1, 2 };
        int[] calcArr = new int[8];
        for (int i = 0; i < 8; i++)
        {
            calcArr[i] = idArr[i] * checkArr[i];
        }

        // Calculate sum of resulting array
        int sum = calcArr.Sum(val => val > 9 ? val - 9 : val);

        // Calculate check digit
        int checkDigit = (10 - (sum % 10)) % 10;

        // Compare check digit with last digit of ID
        return idArr[8] == checkDigit;
    }
}
