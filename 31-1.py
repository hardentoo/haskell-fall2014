# $ python 31-1.py

def find(cond, ls, err):
    if len(ls) == 0:
        return err
    return ls[0] if cond(ls[0]) else find(cond, ls[1:], err)

def test(arr):
    return find(lambda x: x > 1000,
                arr,
                find(lambda x: x > 500,
                     arr,
                     find(lambda x: x > 100,
                          arr,
                          0)))

def main():
    arr1 = [1, 1003, 4]
    arr2 = [1, 503, 4]
    arr3 = [1, 103, 4]
    arr4 = [1, 2, 3, 4]
    print test(arr1)
    print test(arr2)
    print test(arr3)
    print test(arr4)

if __name__ == "__main__":
    main()
