def fact_cps(n, f):
    return f(1) if n == 0 else fact_cps(n - 1, lambda x: f(x * n))

def main():
    print fact_cps(3, lambda x: x ** 2) # 36
    print fact_cps(5, lambda x: x) # 120

if __name__ == "__main__":
    main()
