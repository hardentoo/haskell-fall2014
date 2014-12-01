import sys

def allDiffLists2(n, k, cond, pr):
    if k > 0:
        for i in xrange(1, n):
            if not cond(i):
                # As multi-statement lambdas aren't allowed in Python
                def pr2():
                    pr()
                    sys.stdout.write("%d " % i)
                allDiffLists2(n,
                              k - 1,
                              lambda x: cond(x) or x == i,
                              pr2)
    else:
        pr()
        print

def allDiffLists(n, k):
    allDiffLists2(n + 1, k, lambda x: False, lambda: None)

def main():
    allDiffLists(3, 2)

if __name__ == "__main__":
    main()
