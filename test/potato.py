fname = "test-0.csv"

def main(fname):
	f = open(fname, "rb")

	lines = [s.split(",") for s in [x.strip("\n") for x in f.readlines()]]

	result = 1

	for i in xrange(1, len(lines)):
		result *= (float(lines[i][2]) - float(lines[i][1])) / float(lines[i-1][2])

	return result - 1

if __name__ == '__main__':
	print main(fname)