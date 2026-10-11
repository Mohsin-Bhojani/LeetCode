// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses/

class Solution {
    func isValid(_ s: String) -> Bool {
        var Stack: [Character] = []
        let disct: [String: Character] = ["}" : "{", "]" : "[", ")" : "("]

        for i in s {
            if  "({[".contains(i) {
                Stack.append(i)
            } else {
                if Stack.isEmpty {
                    return false
                } else if Stack.last == disct[String(i)] {
                    Stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return Stack.isEmpty
    }
}
