class Node {
  int? data;
  Node? left;
  Node? right;

  Node(int data) {
    this.data = data;
  }
}

class BsTree {
  Node? root;

  void insert(int data) {
    Node? current = root;
    Node? newnode = Node(data);
    if (root == null) {
      root = newnode;
      return;
    }
    while (true) {
      if (data < current!.data!) {
        if (current.left == null) {
          current.left = newnode;
          break;
        }
        current = current.left;
      } else if (data > current.data!) {
        if (current.right == null) {
          current.right = newnode;
          break;
        }
        current = current.right;
      }
    }
  }

  int getclose(int target) {
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

  bool contains(int data) {
    Node? current = root;

    while (current != null) {
      if (data < current.data!) {
        current = current.left;
      } else if (data > current.data!) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void deleta(int data) {
    deleteHelper(data, root, null);
  }

  void deleteHelper(int data, Node? current, Node? parent) {
    while (current != null) {
      if (data < current.data!) {
        parent = current;
        current = current.left;
      } else if (data > current.data!) {
        parent = current;
        current = current.right;
      } else {
        if (current.left != null && current.right != null) {
          current.data = getmin(current.right);
          deleteHelper(current.data!, current.right, current);
        } else {
          Node? child = (current.left != null) ? current.left : current.right;
          if (parent == null) {
            root = child;
          } else {
            if (parent.left == current) {
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

  void inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  void preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

  int getmin(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data!;
    } else {
      return getmin(currentNode!.left);
    }
  }
}

void main() {
  BsTree bst = BsTree();
  bst.insert(10);
  bst.insert(5);
  bst.insert(20);
  bst.insert(30);
  // bst.deleta(10);
  bst.inOrder();
  print(bst.contains(10));
}
