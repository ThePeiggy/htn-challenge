# Usage: python solution.py
# Assuming you have Python 3.x installed and mapped to 'python'.
# If it doesn't work, try py -3 solution.py

import os

data = []

def get_c_ret(rate_list):
    c = 1
    for r in rate_list:
        c *= (1 + r)
    return c-1

def get_naive_return(a, b, c):
    return ((a - b) / c) - 1


with open(os.path.join('test', 'test-0.csv')) as f:
    lines = f.read().strip().split('\n')
    for l in lines:
        data.append(tuple(map(float, l.split(',')[1:])))

rates = []
for i in range(1, len(data)):
    rates.append(get_naive_return(data[i][1], data[i][0], data[i-1][1]))

print(get_c_ret(rates))
