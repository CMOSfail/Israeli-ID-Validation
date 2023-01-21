def isValidIsraeliID(id: String): Boolean = {
    val id = if (id.length < 9) id.padTo(9, "0") else id
    val idArr = id.map(_.asDigit)
    val checkArr = List(1, 2, 1, 2, 1, 2, 1, 2)
    val calcArr = idArr.zip(checkArr).map(x => x._1 * x._2)
    val sum = calcArr.map(x => if (x > 9) x - 9 else x).sum
    val checkDigit = (10 - (sum % 10)) % 10
    idArr.last == checkDigit
}
