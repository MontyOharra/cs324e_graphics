import java.util.Map;

Map<Integer, Integer> frequencies = new HashMap<>();

void setup() {
  size(800,800); 
   String[] lines = loadStrings("wordfrequency.txt");
   
   for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      int frequency = Integer.parseInt(line.split(":")[0].trim());
      int wordCount = Integer.parseInt(line.split(":")[1].trim());
      frequencies.put(frequency, wordCount);
   }
    for (Map.Entry<Integer,Integer> entry : frequencies.entrySet()) 
            System.out.println("Key = " + entry.getKey() +
                             ", Value = " + entry.getValue());
}

void draw() {
    for (Map.Entry<Integer,Integer> entry : frequencies.entrySet()) 
        circle(entry.getKey()*2, height - entry.getValue(), 10);
}
