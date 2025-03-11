class Grid {
  int winWidth;
  int winHeight;
  int cellSize;
  boolean isSimRunning;
  int framerate;
  
  int cellCountX;
  int cellCountY;
  Cell[][] cells;
  
  Grid(int winWidth, int winHeight, int cellSize, int framerate) {
    cellCountX = ceil(winWidth / cellSize);
    cellCountY = ceil(winHeight / cellSize);
    
    this.winWidth = winWidth;
    this.winHeight = winHeight;
    this.cellSize = cellSize;
    this.framerate = framerate;
    
    // Start with simulation paused.
    isSimRunning = false;
    
    cells = new Cell[cellCountY][cellCountX];
    for (int i = 0; i < cellCountY; i++) {
      for (int j = 0; j < cellCountX; j++) {
        cells[i][j] = new Cell(j, i, false); 
      }
    }
  }
  void renderGridLines() {
     for (int i = -1; i < this.winWidth; i += this.cellSize) {
       stroke(120);
       line(i, 0, i, this.winHeight);
     }
     for (int i = -1; i < this.winHeight; i += this.cellSize) {
       stroke(120);
       line(0, i, this.winWidth, i);
     }
  }
  
  void renderCells() {
    for (Cell[] row : cells) {
      for (Cell cell : row) { 
        int cellColor;
        if (cell.isAlive == true) {
          cellColor = color(255);
        } else {
          cellColor = color(0);
        }
        noStroke();
        fill(cellColor);
        rect(cell.x * this.cellSize, cell.y * this.cellSize, this.cellSize * (cell.x + 1), this.cellSize * (cell.y + 1));
      }
    }
  }
  
  void changeCell() {
    int currCellX = floor(mouseX / this.cellSize); 
    int currCellY = floor(mouseY / this.cellSize);
    cells[currCellY][currCellX].toggle();
  }
  
  void calculateNextStep() {
    Cell[][] cellBuffer = new Cell[this.cellCountY][this.cellCountX];
    
    for (int y = 0; y < cells.length; y++) {
       Cell[] row = cells[y];
       for (int x = 0; x < row.length; x++) {
          Cell cell = row[x];
          boolean isCellAlive;
          if (y == 0 || y >= cellCountY - 1 || x == 0 || x >= cellCountX - 1) {
            isCellAlive = false; 
          } else {
            Cell[] neighbors = new Cell[8];
            int idx = 0;
            for (int dy = -1; dy <= 1; dy++) {
              for (int dx = -1; dx <= 1; dx++) {
                // Skip the cell itself:
                if (dx == 0 && dy == 0) {
                  continue;
                }
                // Pull in each neighbor:
                neighbors[idx] = cells[y + dy][x + dx];
                idx++;
              }
            }
            isCellAlive = cell.determineLife(neighbors);
          }
          cellBuffer[y][x] = new Cell(x,y,isCellAlive);
       }
    }
    this.cells = cellBuffer;
  }
}
