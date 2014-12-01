import Data.List
import Data.Maybe

data Expr = Num Int | Var String | Add Expr Expr | Mult Expr Expr | Let String Expr Expr

eval :: Expr -> [(String, Int)] -> Int
eval (Num n) _ = n
eval (Var v) ls = snd $ fromJust $ find (\x -> fst x == v) ls
eval (Add e1 e2) ls = (+) (eval e1 ls) (eval e2 ls)
eval (Mult e1 e2) ls = (*) (eval e1 ls) (eval e2 ls)
eval (Let v ev e) ls = let value = eval ev ls
                           in eval e ((v, value):ls)
