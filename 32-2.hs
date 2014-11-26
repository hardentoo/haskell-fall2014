import Data.List

f :: [Int] -> Maybe Int
f ls = do
  x <- find (<5) ls
  y <- find (>10) ls
  z <- find (/=7) ls
  return (x + y + z)
