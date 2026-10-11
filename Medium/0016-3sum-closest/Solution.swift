// 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest/

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {

        let sorted = nums.sorted()
        let lt = nums.count
        var closest = sorted[0] + sorted[1] + sorted[2]

        for i in 0...lt-2 {
            if i > 0 && sorted[i] == sorted[i-1]{
                continue
            }
            var left = i + 1
            var right = lt - 1

            while left < right {
                let total = sorted[i] + sorted[left] + sorted[right]

                if abs(total - target) < abs(closest - target) {
                    closest = total
                } else if total == target{
                    return total
                } else if total < target {
                    left += 1
                } else if total > target {
                    right -= 1
                }
            }
        }
        return closest
    }
}
