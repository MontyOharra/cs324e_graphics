PrintWriter wordsFile;

void setup() {
  String[] lines  = loadStrings("mytext.txt");
  wordsFile = createWriter("words.txt");
  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    
    // Change
    int lineCharCount = line.length();
    String[] words = split(line, ' ');
    int wordCount = words.length;
    
    print("Character count is: (" + lineCharCount + "). Word count is (" + wordCount + ").");
    
    for (int j = 0; j < words.length; j++) {
      wordsFile.println(words[j]);
    }
  }
  wordsFile.flush();
  wordsFile.close();
}
