import 'dart:collection';

class TrieNode {
  HashMap children = HashMap();
  bool? isEnd;
}

class Trie {
  TrieNode root = TrieNode();

  void insertSubstring(String str) {
    TrieNode temp = root;

    for (int i = 0; i < str.length; i++) {
      if (!temp.children.containsKey(str[i])) {
        TrieNode newnode = TrieNode();
        temp.children[str[i]] = newnode;
      }
      temp = temp.children[str[i]];
    }
    temp.isEnd = true;
  }

  bool contains(String str) {
    TrieNode temp = root;

    for (int i = 0; i < str.length; i++) {
      if (temp.children[str[i]] == null || !temp.children.containsKey(str[i])) {
        return false;
      }
      temp = temp.children[str[i]];
    }
    return true;
  }
}

void main() {
  Trie newnode = Trie();
  newnode.insertSubstring('string');
  print(newnode.contains('tr'));
}
