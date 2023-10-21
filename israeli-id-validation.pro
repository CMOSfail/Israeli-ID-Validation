:- use_module(library(clpfd)).

valid_id_str(IdStr) :-
   string_chars(IdStr, IdChars),
   maplist(atom_number, IdChars, Id),
   valid_id(Id), !.

valid_id(Id) :-
   length(Id, Len),
   Len in 0..9,
   append([FirstDigit], _, Id),
   FirstDigit in 1..9,
   Id ins 0..9,
   NeededZeros #= 9 - Len,
   length(Zeros, NeededZeros),
   maplist(#=(0), Zeros),
   append(Zeros, Id, Padded),
   append(IdInit, [CheckDigit], Padded),
   label(Id),
   check_digit(IdInit, CheckDigit).

check_digit(Id, CheckDigit) :-
   maplist([A, B, C]>>(C #= A * B), Id, [1, 2, 1, 2, 1, 2, 1, 2], Products),
   convlist([X, Y]>>(X #> 9 -> Y #= X - 9 ; Y #= X), Products, FixedDigits),
   sum(FixedDigits, #=, Sum),
   SumMod #= Sum mod 10,
   CheckDigit #= (10 - SumMod) mod 10.
