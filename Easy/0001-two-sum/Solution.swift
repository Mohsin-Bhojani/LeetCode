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
