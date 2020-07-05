//
//  429. N叉树的层序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
import Foundation

class Solution_429 {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        //利用数组双端队列
        var queue = [Node](), res = [[Int]]()
        queue.append(root!)
        while queue.count > 0 {
            var item = [Int]()
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                item.append(node.val)
                queue.append(contentsOf: node.children)
            }
            res.append(item)
        }
        return res
    }
}
