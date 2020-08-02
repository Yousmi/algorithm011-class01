//
//  64.最小路径和.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/7/27.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_64 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let m = grid.count, n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: grid[0].count + 1), count: grid.count + 1)
        for i in 0 ..< m { //往下
            for j in 0 ..< n { //往右
                if i == 0 || j == 0 {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j]) + grid[i][j]
                } else {
                    dp[i + 1][j + 1] = min(dp[i][j + 1], dp[i + 1][j]) + grid[i][j]
                }
            }
        }
        return dp[m][n]
    }
    
    func minPathSum_1(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: grid[0].count),  count: grid.count)
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                 if i == 0 && j == 0 {
                     dp[i][j] = grid[i][j]
                 } else if i == 0 { //向右收走
                     dp[i][j] = grid[i][j] + dp[i][j - 1]
                 } else if j == 0 { //向下收走
                     dp[i][j] = grid[i][j] + dp[i - 1][j]
                 } else {
                     dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])
                 }
            }
        }
        return dp[grid.count - 1][grid[0].count - 1]
    }
}
