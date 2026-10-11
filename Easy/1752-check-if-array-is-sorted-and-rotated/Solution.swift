// 1752. Check if Array Is Sorted and Rotated
// https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/

class Solution {
    func check(_ nums: [Int]) -> Bool {
        var dropCount = 0
        let n = nums.count
        for i in 0..<n {
            if nums[i] > nums[(i + 1) % n ] {
                dropCount += 1
            }
            if dropCount > 1 {
                return false
            }
        }
        return true
    }
}
