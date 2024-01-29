class QuickSort {
  List<int> quick(List<int> list) {
    sort(list, 0, list.length - 1);
    return list;
  }

  void sort(List<int> list, int str, int end) {
    if (str >= end) {
      return;
    }
    int pivot = str;
    int left = str + 1;
    int right = end;

    while (left <= right) {
      if (list[left] > list[pivot] && list[right] < list[pivot]) {
        swap(list, left, right);
        left++;
        right--;
      }
      if (list[left] <= list[pivot]) {
        left++;
      }
      if (list[right] >= list[pivot]) {
        right--;
      }
    }
    swap(list, right, pivot);
    sort(list, str, right - 1);
    sort(list, right + 1, end);
  }

  void swap(List<int> list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}

void main() {
  List<int> list = [8, 1, 100, 6, 4, 2, 3, 7];
  QuickSort q = QuickSort();
  print(q.quick(list));
}
