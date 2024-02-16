// ignore_for_file: prefer_initializing_formals

class Node {
  int? data;
  Node? right;
  Node? left;

  Node(int data) {
    this.data = data;
  }
}

class BinarySearchTree {
  Node? root;

  void insert(int data) {
    Node newnode = Node(data);
    Node? current = root;

    if (current == null) {
      root = newnode;
      return;
    } else {
      while (true) {
        if (data < current!.data!) {
          if (current.left == null) {
            current.left = newnode;
            break;
          }
          current = current.left;
        } else {
          if (data > current.data!) {
            if (current.right == null) {
              current.right = newnode;
              break;
            }
            current = current.right;
          }
        }
      }
    }
  }

  void delete(int data) {
    deleteHelper(data, root, null);
  }

  void deleteHelper(int data, Node? currentNode, Node? parent) {
    while (currentNode != null) {
      if (data < currentNode.data!) {
        parent = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data!) {
        parent = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getmin(currentNode.right);
          deleteHelper(data, currentNode.right, currentNode);
        } else {
          Node? child =
              (currentNode.left != null) ? currentNode.left : currentNode.right;
          if (parent == null) {
            root = child;
          } else {
            if (parent.left == currentNode) {
              parent.left = child;
            } else {
              parent.right = child;
            }
          }
        }
        break;
      }
    }
  }

  int getmin(Node? current) {
    if (current!.left == null) {
      return current.data!;
    } else {
      return getmin(current.left);
    }
  }

  void inOrder() {
    inOrderHelper(root);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  void preOrder() {
    preorderHelper(root);
  }

  preorderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preorderHelper(node.left);
      preorderHelper(node.right);
    }
  }

  bool contains(int target) {
    Node? current = root;

    while (current != null) {
      if (target < current.data!) {
        current = current.left;
      } else if (target > current.data!) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  mainroot() {
    return root?.data;
  }

  int getClose(int target) {
    Node? current = root;
    int closest = current!.data!;

    while (current != null) {
      if ((target - closest).abs() > (target - current.data!).abs()) {
        closest = current.data!;
      }
      if (target < current.data!) {
        current = current.left;
      } else if (target > current.data!) {
        current = current.right;
      } else {
        break;
      }
    }
    return closest;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(20);
  bst.insert(5);
  bst.insert(15);
  //print(bst.mainroot());
  //bst.inOrder();

  // bst.delete(10);
  print(bst.contains(5));
  bst.preOrder();
  print('this is the closet data: ${bst.getClose(16)}');
}
