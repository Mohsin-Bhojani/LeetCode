// 19. Remove Nth Node From End of List
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var nthend: ListNode? = dummy
        var toreturn: ListNode? = dummy

        for _ in 0...n {
            nthend = nthend?.next
        }

        while nthend != nil {
            nthend = nthend?.next
            toreturn = toreturn?.next
        }

        toreturn?.next = toreturn?.next?.next

        return dummy.next
    }
}
