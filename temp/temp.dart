import 'dart:collection';
import 'dart:io';

class TrieNode {
  HashMap children = HashMap();
  bool? isEnd;
}

class Trie {
  TrieNode root = TrieNode();

  void insertSubstringAt(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      if (!node.children.containsKey(str[i])) {
        TrieNode newnode = TrieNode();
        node.children[str[i]] = newnode;
      }
      node = node.children[str[i]];
    }
    node.isEnd = true;
  }

  bool contains(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      if (node.children[str[i]] == null || !node.children.containsKey(str[i])) {
        return false;
      }
      node = node.children[str[i]];
    }
    return true;
  }
}

void main() {
  Trie trie = Trie();
  trie.insertSubstringAt('Akhil');
  stdout.write(trie.contains('Akh'));
}
