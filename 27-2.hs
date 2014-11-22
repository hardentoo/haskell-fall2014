data Tree = Empty | Node Char Tree Tree

prep :: Tree -> String -> String
prep Empty str = ('e':str)
prep (Node v l r) str = let rstr = prep r str
                            lstr = prep l rstr
                                   in ('n':v:lstr)

toStr :: Tree -> String
toStr Empty = "e"
toStr tree = prep tree ""
