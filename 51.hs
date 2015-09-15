dist :: (Int, Int) -> (Int, Int) -> Double
dist (x1, y1) (x2, y2) = sqrt (fromIntegral (x2 - x1) ** 2 + fromIntegral (y2 - y1) ** 2)

isosc :: (Int, Int) -> (Int, Int) -> (Int, Int) -> Bool
isosc a b c = dist a b == dist a c || dist b a == dist b c || dist c a == dist c b
