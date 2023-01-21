isValidIsraeliID :: String -> Bool
isValidIsraeliID id =
    let idArr = fmap digitToInt id
        checkArr = [1, 2, 1, 2, 1, 2, 1, 2]
        calcArr = zipWith (*) idArr checkArr
        sum = sum $ map (\x -> if x > 9 then x-9 else x) calcArr
        checkDigit = (10 - (sum `mod` 10)) `mod` 10
    in idArr !! 8 == checkDigit
