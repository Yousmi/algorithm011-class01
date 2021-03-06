学习笔记

二叉树的层序遍历
```swift
func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var res = [[Int]]()
        _level(root, 0, &res)
        return res
    }

    private func _level(_ root: TreeNode?, _ level: Int, _ res: inout [[Int]]) {
        guard root != nil else {
            return
        }
        if res.count == level {
            let item = [Int]()
            res.append(item)
        }
        res[level].append(root!.val)
        if let left = root!.left {
            _level(left, level + 1, &res)
        }
        if let right = root!.right {
            _level(right, level + 1, &res)
        }
    }
```

Trie 树代码模板 swift
```swift
class Trie {
    private var root: TrieNode = TrieNode()
    private class TrieNode {
        var isEnd: Bool = false
        var links:[Character: TrieNode] = [Character: TrieNode]()
        init() {
        }
        
        func containsKey(_ char: Character) -> Bool {
            return links[char] != nil
        }
        
        func get(_ char: Character) -> TrieNode? {
            return links[char]
        }
        
        func put(_ char: Character, _ node: TrieNode) {
            links[char] = node
        }
    }

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node:TrieNode? = self.root
        for char in word {
            if !node!.containsKey(char) {
                node!.put(char, TrieNode())
            }
            node = node!.get(char)
        }
        node!.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard let node = searchPrefix(word) else {
            return false
        }
        return node.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard let _ = searchPrefix(prefix) else {
            return false
        }
        return true
    }
    
    private func searchPrefix(_ word: String) -> TrieNode? {
        var node:TrieNode? = self.root
        for char in word {
            if node!.containsKey(char) {
                node = node?.get(char)
            } else {
                return nil
            }
        }
        return node
    }
}
```
