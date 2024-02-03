class Node {
  int? data;
  Node? left;
  Node? right;
  Node({required this.data});
}

class BinarySerachTree {
  Node? root;

  void insert(int data) {
    Node newNode = Node(data: data);
    Node? current = root;

    if (root == null) {
      root = newNode;
      print('Inserted: $data');
      return;
    }

    while (true) {
      if (data < current!.data!) {
        if (current.left == null) {
          current.left = newNode;
          print('Inserted: $data');
          break;
        }
        current = current.left;
      } else {
        if (current.right == null) {
          current.right = newNode;
          print('Inserted: $data');
          break;
        }
        current = current.right;
      }
    }
  }

  bool contains(int data) {
    Node? curNode = root;
    while (curNode != null) {
      if (data < curNode.data!) {
        curNode = curNode.left;
      } else if (data > curNode.data!) {
        curNode = curNode.right;
      } else {
        return true;
      }
    }
    return false;
  }
}

void main() {
  BinarySerachTree bst = BinarySerachTree();
  bst.insert(10);
  bst.insert(20);
  bst.insert(30);
  bst.contains(10);
}
