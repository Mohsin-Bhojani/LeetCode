// 1. Two Sum
// https://leetcode.com/problems/two-sum/

// REVIEW (Claude):
// Your code is correct, but it isn't the recommended approach.
// - Python (nested loops): O(n²). Right at the limit for n = 10⁴.
// - Swift (sort + two pointers): O(n log n), and sorting loses the original
//   indices, so you have to look them up again.
// RECOMMENDED: one-pass hash map (value -> index), O(n) time, O(n) space.
// For each number, check whether `target - num` is already in the map BEFORE
// inserting the number itself, so an element can't pair with itself.

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sorted = nums.sorted()
        var right = nums.count - 1
        var left = 0
        while left < right {
            if sorted[left] + sorted[right] == target {
                let leftIndex = nums.firstIndex(of: sorted[left])!
                let rightIndex = nums.lastIndex(of: sorted[right])!
                return [leftIndex, rightIndex]
            } else if sorted[left] + sorted[right] > target {
                right -= 1
            } else {
                left += 1
            }
        }
        return []
    }
}
