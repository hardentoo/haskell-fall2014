toInt :: Num a => ((a -> a) -> a -> a) -> a
toInt ch = ch (+1) 0

inc :: Num a => ((a -> a) -> a -> a) -> ((a -> a) -> a -> a)
inc ch f x = f $ ch f x
