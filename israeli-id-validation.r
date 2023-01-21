isValidIsraeliID <- function(id) {
    id <- if (nchar(id) < 9) { 
        paste(rep("0", 9 - nchar(id)), id, sep = "")
    } else {
        id
    }
    idArr <- as.numeric(strsplit(id, "")[[1]])
    checkArr <- c(1, 2, 1, 2, 1, 2, 1, 2)
    calcArr <- idArr * checkArr
    sum <- sum(ifelse(calcArr > 9, calcArr - 9, calcArr))
    checkDigit <- (10 - (sum %% 10)) %% 10
    return(idArr[9] == checkDigit)
}
