class MergeSort {
  List<int> merge(List<int> list) {
    if (list.length <= 1) {
      return list;
    }
    int mid = list.length ~/ 2;
    List<int> left = merge(list.sublist(0, mid));
    List<int> right = merge(list.sublist(mid));

    return sort(left, right);
  }

  List<int> sort(List<int> left, List<int> right) {
    List<int> result = [];
    int i = 0;
    int j = 0;

    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) {
        result.add(left[i]);
        i++;
      } else {
        result.add(right[j]);
        j++;
      }
    }
    while (i < left.length) {
      result.add(left[i]);
      i++;
    }
    while (j < right.length) {
      result.add(right[j]);
      j++;
    }
    return result;
  }
}

void main() {
  MergeSort ms = MergeSort();
  List<int> list = [1, 5, 44, 7, 2, 33, 3, 6, 4, 9999];
  print(ms.merge(list));
}
