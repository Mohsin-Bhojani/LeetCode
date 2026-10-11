// 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest/

class Solution {
public:
    int threeSumClosest(vector<int>& nums, int target) {
        sort(nums.begin(), nums.end());
        int lt = nums.size();
        int closest = nums[0] + nums[1] + nums[2];

        for (int i = 0; i < lt - 2; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) continue;

            int left = i + 1, right = lt - 1;
            while (left < right) {
                int total = nums[i] + nums[left] + nums[right];
                if (abs(total - target) < abs(closest - target)) {
                    closest = total;
                } else if (total == target) {
                    return total;
                } else if (total < target) {
                    left++;
                } else {
                    right--;
                }
            }
        }
        return closest;
    }
};
