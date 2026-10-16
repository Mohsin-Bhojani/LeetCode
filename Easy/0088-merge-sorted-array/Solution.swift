// 88. Merge Sorted Array
// https://leetcode.com/problems/merge-sorted-array/

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m , j = n
        if n != 0 {
            for k in stride(from: m + n - 1, through: 0, by: -1) {
                if i == 0 && j > 0 {
                    nums1[k] = nums2[j - 1]
                    j -= 1
                } else if j == 0 {
                    break
                } else if nums1[i - 1] > nums2[j - 1] {
                    nums1[k] = nums1[i - 1]
                    i -= 1
                } else {
                    nums1[k] = nums2[j - 1]
                    j -= 1
                }
            }
        }
    }
}