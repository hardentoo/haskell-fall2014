minsum :: [Int] -> Int
minsum [] = 0
minsum [x] = x
minsum (x:y:ls) = foldr min (x + y) (map (\(z1, z2) -> z1 + z2) (zip (y:ls) ls))
