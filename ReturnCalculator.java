import java.util.*;
import java.io.*;

public class ReturnCalculator {
    public static final String fileName = "test/test-0.csv";

    public static void main(String[] args) throws FileNotFoundException {
        Scanner scanner = new Scanner(new File(fileName));

        List<Snapshot> snapshots = new ArrayList<>();
        while (scanner.hasNext()) {
            snapshots.add(new Snapshot(scanner.nextLine()));
        }

        List<Double> subperiodNaiveReturns = new ArrayList<>();
        for (int i = 0, j = 1; j < snapshots.size(); i++, j++) {
            Snapshot day1 = snapshots.get(i);
            Snapshot day2 = snapshots.get(j);
            subperiodNaiveReturns.add(getNaiveReturn(day1, day2));
        }

        double compoundedReturn = 1;
        for (double subperiodNaiveReturn : subperiodNaiveReturns) {
            compoundedReturn *= (subperiodNaiveReturn >= 0) 
                ? (1 + subperiodNaiveReturn) 
                : (1 - subperiodNaiveReturn);
        }
        System.out.println(compoundedReturn);
    }

    private static double getNaiveReturn(Snapshot day1, Snapshot day2) {
        return ((day2.marketValue - day2.cashFlow) / day1.marketValue) - 1;
    }

    private static class Snapshot {
        public String date;
        public double cashFlow;
        public double marketValue;

        public Snapshot(String string) {
            // Parse string.
            String[] separated = string.split(",");

            // TODO: Throw exception if length less than 3.

            this.date = separated[0];
            this.cashFlow = Double.parseDouble(separated[1]);
            this.marketValue = Double.parseDouble(separated[2]);
        }
    }
}
