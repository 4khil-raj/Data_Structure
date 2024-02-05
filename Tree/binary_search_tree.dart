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

  void delete(int data) {}
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
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(10);
  bst.insert(20);
  bst.insert(5);
  print(bst.mainroot());

  bst.delete(10);
  print(bst.contains(10));
}
