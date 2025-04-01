class ItemInfo {
  String memory;
  String hardDrive;
  String cpu;
  String brand;
  String description;
  
  ItemInfo(
    String memory,
    String hardDrive,
    String cpu,
    String brand,
    String description
  ) {
    this.memory = memory;
    this.hardDrive = hardDrive;
    this.cpu = cpu;
    this.brand = brand;
    this.description = description;
  }
}

void setup() {
  size(500, 500); 
  XML root = loadXML("ebay.xml");
  for (XML listing : root.getChildren()) {
    XML itemInfo = listing.getChildren(); 
  }
}

void draw() {
  
}
