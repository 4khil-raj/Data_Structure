void main() {
  List<int> new1 = [1, 2, 3, 4, 6];
  int t = 10;
  List<int> result = [];
  Set<int> s = {};
  for (int i = 0; i < new1.length; i++) {
    int a = t - new1[i];
    if (new1.contains(a)) {
      result.add(a);
      result.add(new1[i]);
      print(result);
      break;
    } else {
      s.add(new1[i]);
    }
  }
}
