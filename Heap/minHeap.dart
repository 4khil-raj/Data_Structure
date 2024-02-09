// ignore_for_file: file_names

class MinHeap {
  List<int> heap = [];

  MinHeap(List<int> list) {
    buildHeap(list);
  }

  void buildHeap(List<int> list) {
    heap = list;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void shiftDown(int currentIndex) {
    int endIndex = heap.length - 1;
    int leftIndex = leftChild(currentIndex);

    while (leftIndex <= endIndex) {
      int rightIndex = rightChild(currentIndex);
      int indexToShift;

      if (rightIndex <= endIndex && heap[rightIndex] < heap[leftIndex]) {
        indexToShift = rightIndex;
      } else {
        indexToShift = leftIndex;
      }
      if (heap[currentIndex] > heap[indexToShift]) {
        swap(heap, currentIndex, indexToShift);
        currentIndex = indexToShift;
        leftIndex = leftChild(currentIndex);
      } else {
        return;
      }
    }
  }

  void shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);
    while (currentIndex > 0 && heap[parentIndex] > heap[currentIndex]) {
      swap(heap, currentIndex, parentIndex);
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  int peek() {
    return heap[0];
  }

  void insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  void remove() {
    swap(heap, 0, heap.length - 1);
    heap.removeLast();
    shiftDown(heap.length - 1);
  }

  void swap(List<int> list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  void diplay() {
    print(heap);
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return 2 * i + 1;
  }

  int rightChild(int i) {
    return 2 * i + 2;
  }
}

void main() {
  List<int> list = [9, 7, 3, 6, 4, 2];
  MinHeap m = MinHeap(list);
  m.insert(10);
  m.insert(20);
  m.insert(30);
  m.insert(40);
  m.remove();
  m.diplay();
}
