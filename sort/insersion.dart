List<int> insertion(List<int> list) {
  for (int i = 1; i < list.length; i++) {
    int current = list[i];
    int j = i - 1;
    while (j >= 0 && list[j] > current) {
      list[j + 1] = list[j];
      j--;
    }
    list[j + 1] = current;
  }
  return list;
}

void main() {
  List<int> list = [100, 20, 10, 5, 9, 3, 82, 50, 2, 6];
  print(insertion(list));
}
