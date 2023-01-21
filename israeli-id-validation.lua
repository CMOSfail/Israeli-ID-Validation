function isValidIsraeliID(id)
    id = string.rep("0", 9 - #id) .. id
    id_arr = {}
    for i=1,#id do
        id_arr[i] = tonumber(id:sub(i,i))
    end
    check_arr = {1, 2, 1, 2, 1, 2, 1, 2}
    calc_arr = {}
    for i=1,8 do
        calc_arr[i] = id_arr[i] * check_arr[i]
    end
    sum = 0
    for i=1,8 do
        if calc_arr[i] > 9 then
            sum = sum + calc_arr[i] - 9
        else
            sum = sum + calc_arr[i]
        end
    end
    check_digit = (10 - (sum % 10)) % 10
    return id_arr[9] == check_digit
end
