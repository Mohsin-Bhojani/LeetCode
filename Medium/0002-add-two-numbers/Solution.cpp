// 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/

// REVIEW (Claude):
// Your Python version converts both lists to integers, adds them and converts
// back. It works only because Python ints have no size limit; with 100 digits it
// overflows in C++ and Swift. You tagged it #review: "Solving without converting
// to list".
// RECOMMENDED: digit-by-digit addition with a carry and a dummy head, like your
// Swift version. Loop while either list has nodes OR carry != 0. Each step:
// sum = d1 + d2 + carry, append sum % 10, carry = sum / 10.
// O(max(m, n)) time, O(1) extra space.

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        // TODO: digit-by-digit addition with a carry and a dummy head
    }
};
