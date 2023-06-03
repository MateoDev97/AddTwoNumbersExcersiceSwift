
import Foundation


var listNode1 = ListNode(2)
var listNode2 = ListNode(4)
var listNode3 = ListNode(3)

listNode1.next = listNode2
listNode2.next = listNode3


var listNode4 = ListNode(5)
var listNode5 = ListNode(6)
var listNode6 = ListNode(4)

listNode4.next = listNode5
listNode5.next = listNode6

var result = Solution.addTwoNumbers(listNode1, listNode4)
dump(result)

var result2 = Solution.addTwoNumbers(ListNode(0), ListNode(0))
dump(result2)


var listNodeA = ListNode(9)
var listNodeB = ListNode(9)
var listNodeC = ListNode(9)
var listNodeD = ListNode(9)
var listNodeE = ListNode(9)
var listNodeF = ListNode(9)
var listNodeG = ListNode(9)

listNodeA.next = listNodeB
listNodeB.next = listNodeC
listNodeC.next = listNodeD
listNodeD.next = listNodeE
listNodeE.next = listNodeF
listNodeF.next = listNodeG


var listNodeH = ListNode(9)
var listNodeI = ListNode(9)
var listNodeJ = ListNode(9)
var listNodeK = ListNode(9)

listNodeH.next = listNodeI
listNodeI.next = listNodeJ
listNodeJ.next = listNodeK

var result3 = Solution.addTwoNumbers(listNodeA, listNodeH)
dump(result3)


class Solution {
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var safeNumber1 = 0
        if let safeList1 = l1 {
            safeNumber1 = getNumberFromListNode(safeList1)
        }
        
        var safeNumber2 = 0
        if let safeList2 = l2 {
            safeNumber2 = getNumberFromListNode(safeList2)
        }
        
        let sum = safeNumber1 + safeNumber2
        
        let newArray = Array(intToArray(sum).reversed())
                
        if newArray.count > 0 {
            
            var listNodesArray = [ListNode]()
            for item in newArray {
                
                listNodesArray.append(ListNode(item))
            }
            
            for (index, _) in listNodesArray.enumerated() {

                if index+1 < listNodesArray.count {
                    listNodesArray[index].next = listNodesArray[index+1]
                }
            }
            
            
            
            return listNodesArray[0]
            
        } else {
            return ListNode()
        }
        
        
    }
    
    static func getNumberFromListNode(_ listNode: ListNode) -> Int {
        var listNodeNumbers: [Int] = []
        let listNodeVal = listNode.val
        var listNodeNext = listNode.next
        
        
        listNodeNumbers.append(listNodeVal)
        
        
        while listNodeNext != nil {
            if let nextValue = listNodeNext?.val {
                listNodeNumbers.append(nextValue)
            }
            listNodeNext = listNodeNext?.next
        }
        
        listNodeNumbers = Array(listNodeNumbers.reversed())
        
        return arrayToInt(listNodeNumbers)
    }
    
    
    
    static func intToArray(_ num: Int) -> [Int] {
        
        let stringNum = String(num)
        var newArray: [Int] = []
        
        for item in stringNum {
            newArray.append(item.wholeNumberValue ?? 0)
        }
        
        return newArray
        
    }

    static func arrayToInt(_ arr: [Int]) -> Int {
        var stringResult = ""
        
        for digit in arr {
            stringResult = stringResult + String(digit)
        }
        
        return Int(stringResult) ?? 0
    }
}



 //Definition for singly-linked list.
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
