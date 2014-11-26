sum_cps :: [Int] -> (Int -> Int) -> Int
sum_cps [] f = f 0
sum_cps (x:ls) f = sum_cps ls (f.(+x))
