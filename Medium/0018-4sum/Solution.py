# 18. 4Sum
# https://leetcode.com/problems/4sum/

class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        result = []
        numbs = sorted(nums)
        n = len(numbs)

        for i in range(n):
            if i > 0 and numbs[i] == numbs[i-1]:
                continue

            for j in range(i+1, n-2):
                if j > i+1 and numbs[j] == numbs[j-1]:
                    continue

                front = j + 1
                back = n - 1

                while front < back:
                    total = numbs[i] + numbs[j] + numbs[front] + numbs[back]

                    if total == target:
                        result.append([numbs[i],numbs[j],numbs[front],numbs[back]])
                        while front < back and numbs[front] == numbs[front+1]:
                            front += 1
                        front += 1
                        back -= 1
                    elif total < target:
                        front += 1
                    else:
                        back -= 1
        return result
