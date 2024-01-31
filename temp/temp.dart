class Node {
  Node? next;
  int? data;

  Node(int data) {
    this.data = data;
  }
}

class Stack {
  Node? top;

  void push(int data) {
    Node newnode = Node(data);
    if (top == null) {
      return;
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
      return;
    } else {
      top = top?.next;
    }
  }
}

void main() {
  Stack s = Stack();
  s.push(1);
  s.push(2);
  s.push(3);
  s.push(4);
  s.pop();
  s.display();
}
