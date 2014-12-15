toInt :: Num a => ((a -> a) -> a -> a) -> a
toInt ch = ch (+1) 0

inc :: Num a => ((a -> a) -> a -> a) -> ((a -> a) -> a -> a)
inc ch f x = f $ ch f x

dec ch = snd $ ch (\(x, y) -> (inc x, x)) (\f x -> x, \f x -> x)

test = toInt (dec (\ f x -> f (f (f x)))) -- 2
