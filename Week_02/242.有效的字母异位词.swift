//
//  242.有效的字母异位词.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
import Foundation
class Solution_242 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var ans1: UInt32 = 1, ans2: UInt32 = 1
        var sum1: UInt32 = 0, sum2: UInt32 = 0
        for c in s.unicodeScalars {
            ans1 = ans1*c.value % UInt32(100000)
            sum1 += c.value
        }
        for c in t.unicodeScalars {
            ans2 = ans2*c.value % UInt32(100000)
            sum2 += c.value
        }
        return ans1 == ans2 && sum1 == sum2
    }
    
    func isAnagram_2(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        let maps = makeMap(s)
        let mapt = makeMap(t)
        for i in maps {
            if mapt[i.key] != i.value {
                return false
            }
        }
        
        return true
    }
    
    private func makeMap(_ s: String ) -> [Character: Int] {
        var res = [Character: Int]()
        s.forEach { (c) in
            if let v = res[c] {
                res[c] = v + 1
            } else {
                res[c] = 1
            }
        }
        return res
    }
}
