// 18. 4Sum
// https://leetcode.com/problems/4sum/

class Solution {
public:
    vector<vector<int>> fourSum(vector<int>& nums, int target) {
        vector<vector<int>> result;
        sort(nums.begin(), nums.end());
        int n = nums.size();

        for (int i = 0; i < n; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) continue;

            for (int j = i + 1; j < n - 2; j++) {
                if (j > i + 1 && nums[j] == nums[j - 1]) continue;

                int front = j + 1, back = n - 1;
                while (front < back) {
                    // Four values up to 1e9 overflow int, so add them as long long
                    long long total = (long long)nums[i] + nums[j] + nums[front] + nums[back];
                    if (total == target) {
                        result.push_back({nums[i], nums[j], nums[front], nums[back]});
                        while (front < back && nums[front] == nums[front + 1]) front++;
                        front++;
                        back--;
                    } else if (total < target) {
                        front++;
                    } else {
                        back--;
                    }
                }
            }
        }
        return result;
    }
};
