class Dnode {
  Dnode? next;
  Dnode? prev;
  int? data;

  Dnode(int data) {
    this.data = data;
  }
}

class DoubleyLinkedlist {
  Dnode? head;
  Dnode? tail;

  void adddata(int value) {
    Dnode newnode = Dnode(value);
    if (head == null) {
      head = newnode;
    } else {
      tail?.next = newnode;
      newnode.prev = tail;
    }
    tail = newnode;
  }

  void delete(int data) {
    Dnode? current = head;
    if (current != null && current.data == data) {
      head = current.next;
    } else {
      while (current != null && current.data != data) {
        current = current.next;
      }
      if (current == null) {
        return;
      }
      if (current == tail) {
        tail = current.prev;
        tail?.next = null;
        return;
      }
      current.next?.prev = current.prev;
      current.prev?.next = current.next;
    }
  }

  void display() {
    Dnode? current = head;

    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  void reverse() {
    Dnode? current = tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }

  void insert(int after, int value) {
    Dnode? newnode = Dnode(value);
    Dnode? current = head;
    while (current != null && current.data != after) {
      current = current.next;
    }
    if (current == null) {
      return;
    }
    if (current == tail) {
      current.next = newnode;
      tail = newnode;
      return;
    }
    // newnode.next = current.next;
    newnode.prev = current;
    current.next?.prev = newnode;
    current.next = newnode;
  }

  void insertbefore(int before, int value) {
    Dnode newnode = Dnode(value);
    Dnode? current = head;
    if (current?.data == before) {
      newnode.next = head;
      head?.prev = newnode;
      head = newnode;
    }
    while (current != null) {
      if (current.data == before) {
        break;
      }
      current = current.next;
    }
    newnode.next = current;
    newnode.prev = current?.prev;
    current!.prev!.next = newnode;
    current.prev = newnode;
  }

//worng code
  void removemid() {
    Dnode? fast = head;
    Dnode? slow = head;
    Dnode? current;
    if (head == null || head?.next == null) {
      print('cannot found the mid');
    } else {
      while (fast != null && fast.next != null) {
        fast = fast.next?.next;
        current = slow;
        slow = slow?.next;
      }
      current?.next = slow?.next;
    }
  }
}

void main() {
  DoubleyLinkedlist list = DoubleyLinkedlist();

  //list.display();
  list.adddata(10);

  list.adddata(20);
  list.adddata(30);
  list.adddata(40);
  list.adddata(50);
  list.adddata(60);
  list.delete(60);
  list.insert(20, 5);
  list.insertbefore(20, 5);
  list.removemid();
  list.display();
  //list.reverse();
}
