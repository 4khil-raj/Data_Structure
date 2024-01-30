int fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

void main() {
  int i = 0;
  while (i < 10) {
    print(fibonacci(i));
    i++;
  }
}
