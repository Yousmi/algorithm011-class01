/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (67.08%)
 * Likes:    561
 * Dislikes: 0
 * Total Accepted:    93.8K
 * Total Submissions: 139.1K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * 根据一棵树的前序遍历与中序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 前序遍历 preorder = [3,9,20,15,7]
 * 中序遍历 inorder = [9,3,15,20,7]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
 class Solution {
    var idx:Int = 0
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if inorder.count != preorder.count {return nil}
        if inorder.count == 0 {return nil}
        let root =  helper(inorder, preorder, idx, preorder.count - 1)
        return root
    }
    
    func helper(_ inorder: [Int], _ preorder: [Int], _ start:Int, _ end: Int)-> TreeNode? {
        if start > end {return nil}
        let node = TreeNode(preorder[idx])
        idx += 1
        if start == end { return node }
        let index = findIdx(inorder, node.val, end)
        node.left = helper(inorder, preorder, start, index-1)
        node.right = helper(inorder, preorder, index+1, end)
        return node
    }
    
    func findIdx(_ inorder: [Int], _ val:Int, _ end:Int)->Int{
        for i in (0...end).reversed(){
            if inorder[i] == val{ return i }
        }
        return 0
    }
}
// @lc code=end

