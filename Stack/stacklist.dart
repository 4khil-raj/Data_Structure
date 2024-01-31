// ignore_for_file: prefer_initializing_formals

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

  void delete(int target) {
    Node? current = top;
    Node? prev;
    if (current == null) {
      return;
    } else {
      while (current != null) {
        if (current.data == target) {
          break;
        }
        prev = current;
        current = current.next;
      }
      prev?.next = current?.next;
    }
  }

  void size() {
    Node? current = top;
    int i = 0;
    if (current == null) {
      return;
    } else {
      while (current != null) {
        i++;
        current = current.next;
      }
    }
    print('Size $i');
  }

  void peek() {
    Node? peek = top;
    if (top != null) {
      print('Peek : ${peek?.data}');
    }
  }
}

void main() {
  Stack list = Stack();
  list.push(1);
  list.push(2);
  list.push(3);
  // list.pop();
  list.delete(3);
  list.display();
  list.size();
  list.peek();
}
