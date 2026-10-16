# 1. Two Sum
# https://leetcode.com/problems/two-sum/

# REVIEW (Claude):
# Your code is correct, but it isn't the recommended approach.
# - Python (nested loops): O(n²). Right at the limit for n = 10⁴.
# - Swift (sort + two pointers): O(n log n), and sorting loses the original
#   indices, so you have to look them up again.
# RECOMMENDED: one-pass hash map (value -> index), O(n) time, O(n) space.
# For each number, check whether `target - num` is already in the map BEFORE
# inserting the number itself, so an element can't pair with itself.

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for indexi, i in enumerate(nums):
            for indexj, j in enumerate(nums):
                if indexi == indexj:
                    pass
                elif i + j == target:
                    return [indexi, indexj]
        
