int sum(int n) {
  if (n <= 1) {
    return n;
  } else {
    return n + sum(n - 1);
  }
}

void main() {
  return print(sum(5));
}
