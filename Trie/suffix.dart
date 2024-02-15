import 'dart:collection';
import 'dart:io';

class TrieNode {
  HashMap children = HashMap();
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = '*';

  Trie(String str) {
    populateSuffixTrie(str);
  }

  void populateSuffixTrie(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubstringStartingAt(i, str);
    }
  }

  void insertSubstringStartingAt(int index, String str) {
    TrieNode node = root;
    for (int i = index; i < str.length; i++) {
      if (!node.children.containsKey(str[i])) {
        TrieNode newnode = TrieNode();
        node.children[str[i]] = newnode;
      }
      node = node.children[str[i]];
    }
    node.children[endSymbol] = TrieNode();
  }

  bool contains(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      if (!node.children.containsKey(str[i])) {
        return false;
      }
      node = node.children[str[i]];
    }
    return node.children.containsKey(endSymbol);
  }
}

void main() {
  Trie trie = Trie('Akhil');
  stdout.write(trie.contains('hil'));
}
