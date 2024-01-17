import 'dart:io';

void main() {
  String s = 'AAABBC';
  int count = 0;
  for (var i = 0; i < s.length; i++) {
    if (s.contains('A')) {
      count++;
    }
  }
}
