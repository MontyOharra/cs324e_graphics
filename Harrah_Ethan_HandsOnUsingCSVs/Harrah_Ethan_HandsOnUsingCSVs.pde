// A custom class to hold each row's data
class DataEntry {
  String gender;
  int affairs;

  DataEntry(String gender, int affairs) {
    this.gender = gender;
    this.affairs = affairs;
  }
}

// We'll store every CSV row in an ArrayList
ArrayList<DataEntry> dataList = new ArrayList<DataEntry>();

void setup() {
  size(400, 200);
  loadData();
}

void draw() {
  background(255);

  // We'll compute sums each frame from dataList
  int maleTotal = 0;
  int femaleTotal = 0;

  // Sum up affairs by gender
  for (DataEntry entry : dataList) {
    if (entry.gender.equalsIgnoreCase("male")) {
      maleTotal += entry.affairs;
    } else if (entry.gender.equalsIgnoreCase("female")) {
      femaleTotal += entry.affairs;
    }
  }

  fill(0);
  textAlign(CENTER, CENTER);
  // Display "Male: X, Female: Y"
  text("Male: " + maleTotal + ", Female: " + femaleTotal, width/2, height/2);
}

void loadData() {
  Table table = loadTable("Affairs.csv", "header");

  for (TableRow row : table.rows()) {
    String gender = row.getString("gender");
    int affairs   = row.getInt("affairs");

    // Create a DataEntry and add it to the list
    dataList.add(new DataEntry(gender, affairs));
  }
}
