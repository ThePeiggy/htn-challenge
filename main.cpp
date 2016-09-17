#include <stdio>
#include <iostream>
#include <fstream>
#include <openvdb/openvdb.h>
#include <openvdb/Grid.h>

template<typename T>
class SnapshotT {
	
public:

	SnapshotT(const std::string& date, const T& cashFlow, const T& marketValue)
		: mDate(date)
		, mCashFlow(cashFlow)
		, mMarketValue(marketValue) { }

	std::string getDate() {

		return mDate;
	}

	T getCashFlow() {

		return mCashFlow;
	}

	T getMarketValue() {

		return mMarketValue;
	}

private:

	const std::string&	mDate;
	const T& 			mCashFlow;
	const T& 			mMarketValue;
};

template <typename T>
class Account {

	typedef typename SnapshotT<T>			Snapshot;
	typedef typename std::vector<Snapshot>	SnapshotList;

public:

	Account(const std::string& filePath) {

		std::ifstream csv;
	  	csv.open(filePath);
	  	
	  	// parse
	  	
	  	csv.close();
	}

private:

	SnapshotList mSnapshots;
};

int main(int argc, char *argv) {

	return 1;
}