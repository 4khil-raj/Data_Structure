int binarysearch(List<int> list, int target) {
  int low = 0;
  int high = list.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    int midvalue = list[mid];

    if (midvalue == target) {
      return mid;
    } else if (midvalue < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> sortedlist = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int target = 6;
  int result = binarysearch(sortedlist, target);

  if (result != -1) {
    print(result);
  } else {
    print('target not found');
  }
}
