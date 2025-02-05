import re
from collections import defaultdict

def parseWords(fileName):
    # Open the text file and generate a list of words.
    file = open(fileName, "r")
    text = file.read().lower()
    words = re.findall(r'[a-z]+', text)
    file.close()
    return words

def allWords(wordList, fileName = "allwords.txt"):
    # Creates a text file containing all words in individual lines.
    file = open(fileName, "w")
    for word in wordList:
        file.write(word + "\n")
    file.close()

def uniqueWords(wordList, fileName = "uniquewords.txt"):
    # Creates a text file containing all unique words in individual lines.
    wordCount = defaultdict(int)
    for word in wordList:
        wordCount[word] += 1

    # Extract only words with a count of 1.
    uniqueWordList = []
    for word, count in wordCount.items():
        if count == 1:
            uniqueWordList.append(word)

    file = open(fileName, "w")
    for word in uniqueWordList:
        file.write(word + "\n")
    file.close()

def wordFrequency(wordList, fileName = "wordfrequency.txt"):
    # Creates a text file mapping the frequency number to the number of words with said frequency.
    
    # Word: Count
    wordCount = defaultdict(int)
    for word in wordList:
        wordCount[word] += 1

    # Frequency: Number of words
    frequencyCount = defaultdict(int)
    for freq in wordCount.values():
        frequencyCount[freq] += 1

    file = open(fileName, "w")
    for freq in sorted(frequencyCount):
        file.write(f"{freq}: {frequencyCount[freq]}\n")
    file.close()


def main():
    #  Input the text file name to create the three output text files.
    inputFile = "mytext.txt"
    words = parseWords(inputFile)
    allWords(words)
    uniqueWords(words)
    wordFrequency(words)

if __name__ == "__main__":
    main()