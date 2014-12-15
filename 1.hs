intersect :: [(Int, Int)] -> (Int, Int) -> Int
intersect [] (x1, x2) = x2 - x1
intersect ((y1, y2):ls) (x1, x2) = intersect ls (if x2 <= y1 || y2 <= x1 then (x1, x2) else (max x1 y1, min x2 y2))

f :: [(Int, Int)] -> Int
f [] = 0
f (x:ls) = intersect ls x + f ls -- или просто foldr :)

test = f [(1,4), (7,10), (2,6), (3,5)] -- 8
