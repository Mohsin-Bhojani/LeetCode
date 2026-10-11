# 16. 3Sum Closest
# https://leetcode.com/problems/3sum-closest/

class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:

        nums.sort()
        lt = len(nums)
        closest = nums[0] + nums[1] + nums[2]

        for i in range(lt-2):
            if i > 0 and nums[i] == nums[i - 1]:
                continue

            left = i + 1
            right = lt - 1

            while left < right:
                total = nums[i] + nums[left] + nums[right]

                if abs(total - target) < abs(closest - target):
                    closest = total
                elif total == target:
                    return total
                elif total < target:
                    left += 1
                elif total > target:
                    right -= 1
        return closest
