import Data.List
import Data.Maybe

data Expr = Num Int | Var String | Add Expr Expr | Mult Expr Expr | Let String Expr Expr | LetFunc String String Expr Expr | Call String Expr

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, x, _) = x

third :: (a, b, c) -> c
third (_, _, x) = x

eval :: Expr -> [(String, Int)] -> [(String, String, Expr)] -> Int
eval (Num n) _ _ = n
eval (Var v) ls _ = snd $ fromJust $ find (\x -> fst x == v) ls
eval (Add e1 e2) ls fls = (+) (eval e1 ls fls) (eval e2 ls fls)
eval (Mult e1 e2) ls fls = (*) (eval e1 ls fls) (eval e2 ls fls)
eval (Let v ev e) ls fls = let value = eval ev ls fls
                                       in eval e ((v, value):ls) fls
eval (LetFunc f x fe e) ls fls = eval e ls ((f, x, fe):fls) 
eval (Call f e) ls fls = let x = eval e ls fls
                             y = fromJust $ find (\t -> first t == f) fls
                                 in eval (third y) ((second y, x):ls) fls
