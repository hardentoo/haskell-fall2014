toInt :: Num a => ((a -> a) -> a -> a) -> a
toInt ch = ch (+1) 0
