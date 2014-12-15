class Expr:
    def __init__(self, expr_type, value=None, arg1=None, arg2=None):
        self.expr_type = expr_type # Types: "Num", "X", "Add", "Mult"
        self.value = value # Only for "Num"
        self.arg1 = arg1 # Only for "Add" and "Mult"
        self.arg2 = arg2 # Only for "Add" and "Mult"

    def __repr__(self): # Instead of "deriving Show"
        if self.expr_type == "Num":
            return "(Num " + str(self.value) + ")"
        if self.expr_type == "X":
            return "X"
        if self.expr_type == "Add":
            return "(Add " + str(self.arg1) + " " + str(self.arg2) + ")"
        if self.expr_type == "Mult":
            return "(Mult " + str(self.arg1) + " " + str(self.arg2) + ")"
        return None

def diff(expr):
    if expr.expr_type == "Num":
        return 0.0
    if expr.expr_type == "X":
        return 1.0
    if expr.expr_type == "Add":
        return Expr("Add", arg1 = diff(expr.arg1), arg2 = diff(expr.arg2))
    if expr.expr_type == "Mult":
        return Expr("Add",
                    arg1 = Expr("Mult",
                                arg1 = diff(expr.arg1),
                                arg2 = expr.arg2),
                    arg2 = Expr("Mult",
                                arg1 = diff(expr.arg2),
                                arg2 = expr.arg1))
    return None

def main():
    print diff(Expr("Mult", arg1 = Expr("Num", 5.0), arg2 = Expr("X")))
    print diff(Expr("Mult", arg1 = Expr("X"), arg2 = Expr("X")))

if __name__ == "__main__":
    main()
