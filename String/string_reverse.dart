import 'dart:io';

void main() {
  String s = 'Malayalam';
  int i = s.length;
  while (i > 0) {
    i--;
    stdout.write(s[i]);
  }
}
