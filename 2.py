class Node:
    def __init__(self, v = None, left = None, right = None):
        self.v = v # If v is None, the tree is empty.
        self.left = left
        self.right = right

def foldTree(f, e, node):
    if node.v is None:
        return e
    return f(node.v,
             foldTree(f, e, node.left),
             foldTree(f, e, node.right))

def main():
    tree = Node(1, Node(1, Node(), Node()), Node())
    print foldTree(lambda x, y, z: 1 + max(y, z), 0, tree)

if __name__ == "__main__":
    main()

    
