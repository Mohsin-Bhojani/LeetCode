# 4. Median of Two Sorted Arrays
# https://leetcode.com/problems/median-of-two-sorted-arrays/

# REVIEW (Claude):
# Your code is correct, and LeetCode accepts it, but the problem explicitly asks for
# O(log(m + n)). Merging and sorting is O((m + n) log(m + n)), and even a linear
# two-pointer merge is O(m + n).
# RECOMMENDED: binary search on a partition of the SHORTER array. Pick i elements
# from nums1 and j = (m + n + 1) / 2 - i from nums2 so that the left halves
# together hold half of all elements. The partition is right when
# maxLeft1 <= minRight2 and maxLeft2 <= minRight1 (use -inf / +inf past the ends).
# Then the median comes from max(left sides) and min(right sides).
# O(log(min(m, n))) time, O(1) space.

class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        mergedlist = nums1 + nums2
        mergedlist.sort()
        middleindex = len(mergedlist) // 2
        if len(mergedlist) % 2 == 0:
            return (mergedlist[middleindex] + mergedlist[middleindex - 1])/2
        else:
            return mergedlist[middleindex]
