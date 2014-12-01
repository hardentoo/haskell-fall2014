find :: (Int -> Bool) -> [Int] -> (Int, [Int])
find cond [] = (-1, []) -- Это некорректно, но мы же для простоты считаем, что find всегда точно найдёт элемент, удовлетворяющий условию. Пришлось добавить эту строчку из-за ошибки "Non-exhaustive patterns in function find".
find cond (x:xs) = if cond x then (x, xs) else find cond xs

return1 :: a -> [a] -> (a, [a])
return1 a ls = (a, ls)

(>>>=) :: ([a] -> (a, [a])) -> (a -> ([a] -> (a, [a]))) -> ([a] -> (a, [a]))
f >>>= g = \ls ->
  let
    (res, ls1) = f ls
  in (g res) ls1


test = (find (>3) >>>= \x -> find (>x) >>>= \y -> return1 (x + y)) [1, 2, 8, 4, 9, 3, 25]
