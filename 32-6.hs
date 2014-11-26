data Expr = Num Int | X | Add Expr Expr | Mult Expr Expr deriving (Eq, Show)
-- Насколько я поняла из условия задания, тут выражения только от одной переменной уже.

simplify :: Expr -> Expr
simplify (Mult e1 e2) = let se1 = simplify e1
                            se2 = simplify e2
                                  in if se1 == Num 0 || se2 == Num 0
                                        then Num 0 else Mult se1 se2
simplify e = e
