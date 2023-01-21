Function IsValidIsraeliID(id As String) As Boolean
    ' Add leading zeroes if ID is less than 9 digits
    id = id.PadLeft(9, "0"c)

    ' Convert ID to array of integers
    Dim id_arr() As Integer = id.Select(Function(c) Integer.Parse(c.ToString())).ToArray()

    ' Multiply first 8 digits by check array
    Dim check_arr() As Integer = {1, 2, 1, 2, 1, 2, 1, 2}
    Dim calc_arr() As Integer = (From i In Enumerable.Range(0, 8) Select id_arr(i) * check_arr(i)).ToArray()

    ' Calculate sum of resulting array
    Dim sum As Integer = calc_arr.Sum(Function(val) If(val > 9, val - 9, val))

    ' Calculate check digit
    Dim check_digit As Integer = (10 - (sum Mod 10)) Mod 10

    ' Compare check digit with last digit of ID
    Return id_arr(8) = check_digit
End Function