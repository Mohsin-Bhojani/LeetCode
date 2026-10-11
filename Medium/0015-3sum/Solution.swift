// 15. 3Sum
// https://leetcode.com/problems/3sum/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var l0 = [[Int]]()
        let sorted = nums.sorted()
        let lt = sorted.count

        for i in 0...lt-2{
            if i > 0 && sorted[i] == sorted[i - 1] {
                continue
            }

            var left = i + 1
            var right = lt - 1

            while left < right {
                let total = sorted[i] + sorted[left] + sorted[right]

                if total == 0{
                    l0.append([sorted[i], sorted[left],sorted[right]])
                    while left < right && sorted[left] == sorted[left + 1]{
                        left += 1
                    }
                    left += 1
                    right -= 1
                }
                else if total < 0 {
                    left += 1
                }
                else {
                    right -= 1
                }
            }
        }
        return l0
    }
}
