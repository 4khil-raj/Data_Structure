import 'dart:io';

class Encription {
  String change(String value, int key) {
    int newkey = key % 26;
    List<String> char = [];
    for (var i = 0; i < value.length; i++) {
      int letterpossition = value.codeUnitAt(i) + newkey;
      if (letterpossition < 122) {
        char.add(String.fromCharCode(letterpossition));
      } else {
        char.add(String.fromCharCode(96 + letterpossition % 122));
      }
    }
    return char.join();
  }
}

void main() {
  Encription charector = Encription();
  String value = 'hai';
  int key = 2;
  stdout.write(charector.change(value, key));
}
