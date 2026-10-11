class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for indexi, i in enumerate(nums):
            for indexj, j in enumerate(nums):
                if indexi == indexj:
                    pass
                elif i + j == target:
                    return [indexi, indexj]
        
