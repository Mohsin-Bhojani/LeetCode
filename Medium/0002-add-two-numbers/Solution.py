# 2. Add Two Numbers
# https://leetcode.com/problems/add-two-numbers/

# Paste the LeetCode starter code here and solve it.
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
