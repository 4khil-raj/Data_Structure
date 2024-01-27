List<int> selection(List<int> list) {
  for (int i = 0; i < list.length; i++) {
    int small = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[small] > list[j]) {
        small = j;
      }
    }
    int temp = list[small];
    list[small] = list[i];
    list[i] = temp;
  }

  return list;
}

void main() {
  List<int> list = [5, 6, 7, 74, 1, 66, 10, 2];
  print(selection(list));
}
