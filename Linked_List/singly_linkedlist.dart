// ignore_for_file: prefer_initializing_formals
class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
  }
}

class SinglyLinkedList {
  Node? head;
  Node? tail;

//add value
  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  //delete a element
  void delete(int data) {
    Node? temp = head;
    Node? prev;
    if (temp != null && temp.data == data) {
      head = temp.next;
    } else {
      while (temp != null && temp.data != data) {
        prev = temp;
        temp = temp.next;
      }
      if (temp == null) {
        return;
      }
      if (temp == tail) {
        tail = prev;
        tail?.next = null;
        return;
      }
      prev?.next = temp.next;
    }
  }

  //search
  void search(int target) {
    Node? current = head;
    int i = 0;
    current ?? print('empty');
    while (current != null) {
      if (current.data == target) {
        print('item found index ${i + 1}');
      }
      i++;
      current = current.next;
    }
  }

// to display the list value
  void disply() {
    Node? temp = head;
    if (temp == null) {
      print('node was emplty');
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void insertbefor(int before, int value) {
    Node newnode = Node(value);
    Node? prev;
    Node? current = head;
    if (current?.data == before) {
      head = newnode;
      head?.next = current;
    } else {
      while (current != null && current.data != before) {
        prev = current;
        current = current.next;
      }
      if (current == null) {
        return;
      }

      prev?.next = newnode;
      newnode.next = current;
    }
  }

  void reverse() {
    Node? current = head;
    Node? nextnode = head;
    Node? prev;
    while (current != null) {
      nextnode = current.next;
      current.next = prev;
      prev = current;
      current = nextnode;
    }
    head = prev;
  }

  void insertafter(int after, int value) {
    Node? newnode = Node(value);
    Node? temp = head;

    while (temp != null && temp.data != after) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail!.next = newnode;
      tail = newnode;
      return;
    }
    newnode.next = temp.next;
    temp.next = newnode;
  }

  void addmiddle(int data) {
    Node newnode = Node(data);
    Node? fast = head;
    Node? slow = head;
    Node? current;
    if (fast == null || fast.next == null) {
      print('cant found it');
    } else {
      while (fast != null && fast.next != null) {
        fast = fast.next?.next;
        current = slow;
        slow = slow?.next;
      }
      current?.next = newnode;
      newnode.next = slow;
    }
  }

  //delete at middle
  void deleteMiddle() {
    if (head == null || head!.next == null) {
      print("List has only 0/1 node , Can't find a middle");
    }
    Node? fast = head;
    Node? slow = head;
    Node? prev;
    while (fast != null && fast.next != null) {
      fast = fast.next!.next;
      prev = slow;
      slow = slow?.next;
    }
    prev!.next = slow!.next;
  }

  void removeDuplicate() {
    Node? current = head;
    while (current != null) {
      Node? next = current;
      while (next!.next != null) {
        if (current.data == next.next!.data) {
          next.next = next.next!.next;
        } else {
          next = next.next;
        }
      }
      current = next.next;
    }
  }
}

void main() {
  SinglyLinkedList list = SinglyLinkedList();
  list.addNode(10);
  list.addNode(250);
  list.addNode(200);
  list.addNode(10000);
  list.addNode(10);
  list.addNode(50);
  list.addNode(23);
  // list.delete(50);
  // list.insertafter(20, 100);
  list.removeDuplicate();
  // list.insertbefor(23, 15);
  // list.reverse();
  // list.search(10);
  // list.deleteMiddle();
  // list.addmiddle(5555);
  list.disply();
}
