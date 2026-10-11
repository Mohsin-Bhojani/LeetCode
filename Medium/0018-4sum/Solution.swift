// 18. 4Sum
// https://leetcode.com/problems/4sum/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        let sorted = nums.sorted()
        let n = sorted.count
        var front: Int
        var back: Int

        for i in 0..<n{
            if i > 0 && sorted[i] == sorted[i-1]{
                continue
            }

            for j in i+1..<n{
                if j > i + 1 && sorted[j] == sorted[j-1]{
                    continue
                }

                front = j + 1
                back = n - 1

                while front < back {
                    let total = sorted[i] + sorted[j] + sorted[front] + sorted[back]

                    if total == target {
                        result.append(
                            [sorted[i], sorted[j], sorted[front], sorted[back]]
                            )
                        while front < back && sorted[front] == sorted[front+1]{
                            front += 1
                        }
                        front += 1
                        back -= 1
                    } else if total < target {
                        front += 1
                    } else {
                        back -= 1
                    }
                }
            }
        }
        return result
    }
}
