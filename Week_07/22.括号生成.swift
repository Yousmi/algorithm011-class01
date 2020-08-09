//
//  22.括号生成.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/11.
//  Copyright © 2020 钱志新. All rights reserved.
//

//数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
import Foundation
class Solution_22 {
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        _generate(0, 0, n, "", &res)
        return res
    }
    private func _generate(_ left: Int, _ right: Int, _ n: Int, _ str: String, _ res: inout [String]) {
        if left == n && right == n {
            res.append(str)
            return
        }
        
        if left < n {
            _generate(left + 1, right, n, str + "(", &res)
        }
        if left > right {
            _generate(left, right + 1, n, str + ")", &res)
        }
    }
    
    func generateParenthesis_1(_ n: Int) -> [String] {
        var res = [String]()
        generateParenthesis_rev(&res, n, 0, 0, "")
        return res
    }
    
    private func generateParenthesis_rev(_ res: inout [String], _ n: Int, _ left: Int, _ right: Int, _ item: String) {
        if left == n && right == n {
            res.append(item)
        }
        
        if left < n {
            generateParenthesis_rev(&res, n, left + 1, right, item + "(")
        }
        if left > right {
            generateParenthesis_rev(&res, n, left, right + 1, item + ")")
        }
    }
}
