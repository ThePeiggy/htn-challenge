# denson@ualberta.ca
# Feed input via pipes to get result (i.e. Python return.py < testinput > testoutput)

import sys

def weighted_return(comma_separated_values):
    if (len(comma_separated_values) == 0): return None

    last_market = comma_separated_values[0]
    sub_periods = [(float(comma_separated_values[i][2]) - float(comma_separated_values[i][1]))/float(last_market[2]) - 1 for i in range(2,len(comma_separated_values))]

    weighted_return_value = 1
    for x in sub_periods:
        weighted_return_value *= (1 + x)
    return weighted_return_value

input_string = sys.stdin.read().split("\n")
comma_separated_values = list(filter(lambda x: len(x) == 3, [line.split(',') for line in input_string]))

print(weighted_return(comma_separated_values))