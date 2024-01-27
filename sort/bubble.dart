List<int> bubble(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    for (int j = 0; j < list.length - 1 - i; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

void main() {
  List<int> list = [5, 2, 7, 6, 99, 3, 1, 4, 25, 55, 10];
  print(bubble(list));
}
