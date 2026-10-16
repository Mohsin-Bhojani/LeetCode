# 2. Add Two Numbers
# https://leetcode.com/problems/add-two-numbers/

# REVIEW (Claude):
# Your Python version converts both lists to integers, adds them and converts
# back. It works only because Python ints have no size limit; with 100 digits it
# overflows in C++ and Swift. You tagged it #review: "Solving without converting
# to list".
# RECOMMENDED: digit-by-digit addition with a carry and a dummy head, like your
# Swift version. Loop while either list has nodes OR carry != 0. Each step:
# sum = d1 + d2 + carry, append sum % 10, carry = sum / 10.
# O(max(m, n)) time, O(1) extra space.

class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:

        current1 = l1
        result1 = []
        while current1:
            result1.append(current1.val)
            current1 = current1.next
    
        current2 = l2
        result2 = []
        while current2:
            result2.append(current2.val)
            current2 = current2.next
        
        num1 = 0
        for index, i in enumerate(result1):
            num1 += i * (10**index) 

        num2 = 0
        for index, i in enumerate(result2):
            num2 += i * (10**index) 
        
        summ = num1 + num2
        sumlist = []
        for i in str(summ):
            sumlist.append(i)
        
        sumlist_rev = sumlist[::-1]

        head = ListNode(int(sumlist_rev[0]))
        current = head
        for item in sumlist_rev[1:]:
            current.next = ListNode(int(item))
            current = current.next
        

        return head
