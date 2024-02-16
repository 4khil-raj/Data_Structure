int countOnes(List<List<int>> matrix) {
  int count = 0;
  for (List<int> list in matrix) {
    for (int element in list) {
      if (element == 1) {
        count++;
      }
    }
  }
  return count;
}

void main() {
  List<List<int>> matrix = [
    [1, 0, 0, 1],
    [0, 1, 0, 1, 1],
    [1, 0, 0, 1]
  ];

  int count = countOnes(matrix);
  print("$count");
}
