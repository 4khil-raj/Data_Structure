class Node1 {
  int? data;
  Node1? next;

  Node1(int value) {
    data = value;
  }
}

class Slinkedlist {
  Node1? head;
  Node1? tail;

  void add(int addvalue) {
    Node1 newnodee = Node1(addvalue);
    if (head == null) {
      head = newnodee;
    } else {
      tail?.next = newnodee;
    }
    tail = newnodee;
  }

  void display() {
    Node1? temp = head;

    if (temp == null) {
      return;
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void delete(int value) {
    Node1? temp = head;
    Node1? prev;
    if (temp != null && temp.data == value) {
      head = temp.next;
    } else {
      while (temp != null && temp.data != value) {
        prev = temp;
        temp = temp.next;
      }
      if (temp == null) {
        return;
      }
      if (temp == tail) {
        tail = prev;
        tail?.next = null;
      }
      prev?.next = temp.next;
    }
  }
}

void main() {
  Slinkedlist list = Slinkedlist();
  list.add(100);
  list.add(200);
  list.add(300);
  list.add(400);
  list.delete(100);
  list.display();
}
