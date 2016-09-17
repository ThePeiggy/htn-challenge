from dateutil.parser import parse

class ReturnCalculator:
  def __init__(self, filename):
    self.snapshots = self.read_snapshots(filename)

  def calculate(self):
    snapshots = self.snapshots
    if (len(snapshots) < 2):
      return 0
    runningProduct = 1
    for i in range(len(snapshots) - 1):
      if (snapshots[i]['market_value'] == 0):
        return 0
      runningProduct *= (snapshots[i+1]['market_value'] - snapshots[i+1]['cash_flow']) / snapshots[i]['market_value']
    return runningProduct - 1

  def read_snapshots(self, filename):
    fil = open(filename, 'r')
    snapshots = []
    for line in fil:
      row = line.split(',')
      date = parse(row[0])
      cash_flow = float(row[1])
      market_value = float(row[2])
      snapshots.append({ 'date': date, 'cash_flow': cash_flow, 'market_value': market_value })
    return snapshots

a = ReturnCalculator('test/test-0.csv')
print a.calculate()
