import csv

compound_return = 1.0

with open('test/test-0.csv', 'rb') as csvfile:
  reader = csv.reader(csvfile, delimiter=',')
  previous = None
  current = None
  for row in reader: # assuming entries are in chronological order, from oldest first to most recent
    current = row
    if not previous: # init case, if only one row, will return 1.0 since only 1 period
      previous = current
      continue
    else:
      sub_rate = (float(current[2]) - float(current[1])) / float(previous[2])
      compound_return *= sub_rate


print 'Compound return is ' + str(compound_return - 1)
