void main() {
  List<int> nums = [1, 5, 2, 1, 7, 4, 1, 1];
  int t = 1;
  for (var i = 0; i < nums.length;) {
    for (var j = nums.length - 1; j > i;) {
      if (nums[j] == t) {
        j--;
      } else if (nums[i] == t) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
        i++;
      } else {
        i++;
      }
    }
    i++;
  }
  print(nums);
}
