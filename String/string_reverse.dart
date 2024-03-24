void main() {
  String s = 'malayalam';
  String m = s.split('').reversed.join('');
  print(m);
  s == m ? print('palindrome') : print('not palindrom');
  print(s.split('').reversed.join(''));
  // int i = s.length;
  // while (i > 0) {
  //   i--;
  //   stdout.write(s[i]);
  // }
}
