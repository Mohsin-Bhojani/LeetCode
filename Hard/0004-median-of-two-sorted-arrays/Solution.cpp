// 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/

// REVIEW (Claude):
// Your code is correct, and LeetCode accepts it, but the problem explicitly asks for
// O(log(m + n)). Merging and sorting is O((m + n) log(m + n)), and even a linear
// two-pointer merge is O(m + n).
// RECOMMENDED: binary search on a partition of the SHORTER array. Pick i elements
// from nums1 and j = (m + n + 1) / 2 - i from nums2 so that the left halves
// together hold half of all elements. The partition is right when
// maxLeft1 <= minRight2 and maxLeft2 <= minRight1 (use -inf / +inf past the ends).
// Then the median comes from max(left sides) and min(right sides).
// O(log(min(m, n))) time, O(1) space.

class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        // TODO: binary search on the partition of the shorter array
    }
};
