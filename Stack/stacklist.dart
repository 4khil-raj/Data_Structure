class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class Stack {
  Node? top;

  void push(int data) {
    Node newnode = Node(data);
    if (top == null) {
      top = newnode;
    } else {
      newnode.next = top;
      top = newnode;
    }
  }

  void display() {
    Node? current = top;
    if (current == null) {
      return;
    } else {
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }

  void pop() {
    if (top == null) {
      print('stack underflow');
    } else {
      top = top?.next;
    }
  }
}

void main() {
  Stack list = Stack();
  list.push(1);
  list.push(2);
  list.push(3);
  list.pop();
  list.display();
}
