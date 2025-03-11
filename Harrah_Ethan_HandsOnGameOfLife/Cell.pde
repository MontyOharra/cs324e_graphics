class Cell {
  int x;
  int y;
  boolean isAlive;
  
  Cell(int x, int y, boolean isAlive) {
    this.x = x;
    this.y = y;
    this.isAlive = isAlive; 
}
  
  void setLife(boolean isAlive) {
    this.isAlive = isAlive; 
  }
  
  void toggle() {
    if (this.isAlive == true) {
      setLife(false); 
    } else {
      setLife(true);
    } 
  }
  
  boolean determineLife(Cell[] neighbors) {
     int liveNeighbors = 0;
     for (Cell neighbor : neighbors) {
       if (neighbor.isAlive == true) {
         liveNeighbors += 1; 
       }
     }
     
     if (this.isAlive == true) {
       if (2 == liveNeighbors || liveNeighbors == 3) {
         return true; 
       } else {
         return false; 
       }    
     } else {
       if (3 == liveNeighbors) {
         return true;
       } else {
         return false; 
       }
     }

  }
}
