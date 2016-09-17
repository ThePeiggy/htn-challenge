import java.io.*;
import java.util.*;

/* Run by entering file name, program will output answer
 * atarw11@outlook.com (Atharva Washimkar)
 * Time complexity: O (N)
 */

public class HTN {
 
  public static void main (String [] t) throws IOException {
    BufferedReader in = new BufferedReader (new InputStreamReader (System.in));
    BufferedReader file = new BufferedReader (new FileReader (in.readLine()));
    
    List <Snapshot> list = new ArrayList <Snapshot> ();
    String ln;
    
    while (true) {
      ln = file.readLine ();
      
      if (ln == null) {
        break;
      }
      
      t = ln.split (",");
      list.add (new Snapshot (Double.parseDouble (t [1]), Double.parseDouble (t [2])));
    }
    
    double current_market_value = 0.0, previous_market_value = 0.0;
    List <Double> subperiods = new ArrayList <Double> ();
    
    for (int s = 1; s < list.size (); s++) {
      current_market_value = list.get (s).market_value - list.get (s - 1).cash_flow;
      previous_market_value = list.get (s - 1).market_value;
      subperiods.add (current_market_value / previous_market_value - 1);
    }
    
    double time_weighted_return = 1.0;
    
    for (int s = 0; s < subperiods.size (); s++) {
      time_weighted_return *= (1.0 + subperiods.get (s));
    }
    
    System.out.println ((time_weighted_return - 1) * 100);
  }
}

class Snapshot {
  double cash_flow, market_value;
  
  public Snapshot (double cash_flow, double market_value) {
    this.cash_flow = cash_flow;
    this.market_value = market_value;
  }
}