void main() {
  List<int> list = [1, 5, 2, 1, 7, 4, 1, 1];
  int target = 1;
  for (int i = 0; i < list.length;) {
    for (int j = list.length - 1; j > i;) {
      if (list[j] == target) {
        j--;
      } else if (list[i] == target) {
        int temp = list[i];
        list[i] = list[j];
        list[j] = temp;
        i++;
      } else {
        i++;
      }
    }
    i++;
  }
  print(list);
}
