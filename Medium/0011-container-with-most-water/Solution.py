# 11. Container With Most Water
# https://leetcode.com/problems/container-with-most-water/

class Solution:
    def maxArea(self, height: List[int]) -> int:
        max_area = 0
        l_index = len(height) - 1
        r_index = 0

        while r_index < l_index:
            if height[r_index] < height[l_index]:
                area = (l_index - r_index) * height[r_index]
            else:
                area = (l_index - r_index) * height[l_index]
            if max_area < area *-1:
                max_area = area*-1
            elif max_area < area:
                max_area = area
            if height[r_index] < height[l_index]:
                r_index += 1
            else:
                l_index -= 1

        return max_area
