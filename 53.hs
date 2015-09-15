-- Предполагаю, что цены в рублях за кг всё же целые числа.
data Candy = Cake String Int | Sweet String Int Float

price :: Candy -> Float
price (Cake name p) = fromIntegral p
price (Sweet name p w) = fromIntegral p * w

totalPrice :: [Candy] -> Float
totalPrice ls = foldr (\x y -> price x + y) 0.0 ls

test = totalPrice [Cake "cake1" 250, Sweet "sweet1" 1000 0.5, Cake "cake1" 250]
