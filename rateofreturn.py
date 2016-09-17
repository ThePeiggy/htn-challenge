import csv

def rate_of_return():
    #first we need to parse the things
    with open('test/test-0.csv', 'r') as f:
        reader = csv.reader(f)
        your_list = list(reader)

    print(your_list)

#we dont want to run it on the last one though!
    total_ror = 1
    for i in range(1, len(your_list)):
        #algorithm: find market value at day n and cash flow from day n
        # subtract cash flow of day n from market value of day n
        # divide this quantity by day n-1 market value
        curr_mkt_value = float(your_list[i][2])
        curr_cash_value= float(your_list[i][1])
        today_starting = curr_mkt_value-curr_cash_value
        ror_today = today_starting/float(your_list[i-1][2])
        total_ror = ror_today * total_ror
    return total_ror

print (rate_of_return())