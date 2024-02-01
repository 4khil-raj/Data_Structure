// ignore_for_file: prefer_initializing_formals

class Node {
  Node? next;
  int? data;

  Node(int data) {
    this.data = data;
  }
}

class Queue {
  Node? front;
  Node? rear;
//add node
  void enqueue(int data) {
    Node? newnode = Node(data);
    if (front == null) {
      front = rear = newnode;
      return;
    } else {
      rear?.next = newnode;
      rear = newnode;
    }
  }

  void dequeue() {
    if (front == null) {
      return;
    } else {
      front = front?.next;
      rear = null;
    }
  }

  void display() {
    Node? current = front;
    if (current == null) {
      print('queue is empty');
    } else {
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }
}

void main() {
  Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.dequeue();
  queue.display();
}
