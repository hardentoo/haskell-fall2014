data LogExpr = F | T | X | Not LogExpr | And LogExpr LogExpr | Or LogExpr LogExpr

eval :: LogExpr -> Bool -> Bool
eval F _ = False
eval T _ = True
eval X v = v
eval (Not e) v = not $ eval e v
eval (And e1 e2) v = eval e1 v && eval e2 v
eval (Or e1 e2) v = eval e1 v || eval e2 v

instance Eq LogExpr where
         e1 == e2 = map (eval e1) [False, True] == map (eval e2) [False, True]
