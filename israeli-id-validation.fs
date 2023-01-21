let isValidIsraeliID (id: string) =
    let id = id.PadLeft(9, '0')
    let idArr = id |> Seq.map int
    let checkArr = [1; 2; 1; 2; 1; 2; 1; 2]
    let calcArr = List.zip idArr checkArr |> List.map (fun (i, c) -> i * c)
    let sum = calcArr |> List.fold (fun acc x -> acc + (if x > 9 then x - 9 else x)) 0
    let checkDigit = (10 - (sum % 10)) % 10
    idArr |> List.last = checkDigit
