学习笔记
- 递归模板
```swift
func recur(_ level: Int, _ param: Int) {
    //terminator 
    if level > Int.max {
        // process result
        return 
    }
    //process current level logic
    process(level, param)
    //drill down 
    recur(level + 1, newParam)
    //restore current status
}
```
- 分治
  - 需要分离函数
  - 需要有合并函数
```swift
func divide_conquer(problem, param1, param2, ...) {
    //recursion terminator
    if problem == nil {
        print_result
        return
    }
    // prepare data
    data = prepare_data(problem)
    sub_problems = split_problem(problem, data)

    //conquer subproblems
    subresult1 = divide_conquer(sub_problems[0], param1, param2, ...)
    subresult2 = divide_conquer(sub_problems[1], param1, param2, ...)
    ...

    //process and generate the final result
    result = process_result(subresult1, subresult2, ...)

    //revert current level states
}
```
```swift
1. 人肉递归低效、很累 -- 拒绝人肉递归
2. 找到最近最简方法，将其拆解成可重复解决的问题
3. 数学归纳法
```
- 本质是： 寻找重复的子问题

二分法查找
```swift
func rev(_ nums:[Int], _ left:Int, _ right: Int, _ target: Int) -> Int {
    if left > right {
        return -1
    }
    let mid = left + (right - left) / 2
}
```

##### 动态规划 Dynamic Programming
-  Simplifying a complicated problem by breaking it down into simpler sub-problems
-  Divide&Conquer + Optiomal substructure (分治 + 最优子结构)

- 关键点
  - 动态规划和 递归或者分治没有根本上的区别（关键看有无最优的子结构）
  - 共性： 寻找重复的子问题
  - 差异：最优子结构、中途可以淘汰次优解


最长公共子序列 思路概要
1、转换成二维数组的状态表， dp[i][j] 表示 text中 i 位置的字符到 0 位置字符的最长子串， j 同理， [i][j]表示这2着最大值
2、动态方程： 相等时： dp[i][j] = dp[i][j] + 1, 不同时 dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])

经验：
1、注意参数检测
2、注意边界条件， 不要出现数组越界
3、注意代码简洁和复用


思维小结
1、打破自己的思维习惯、形成机器思维，， 只会 if-else， forloop， 傻递归
2、理解复杂逻辑的关键
3、职业进阶要点

三步解决dp 问题
1、找重复性
2、找dp方程，记忆化搜索
3、合并问题

```swift
五毒神掌

第一遍：
    1、5分钟读题和思路
    2、5分钟想不出来之后 直接看解法：多看几种解法，比较他们的优劣
    3、背诵和默写其解法

第二遍：
    1、马上自己写 -> 直接放到LeetCode上提交，反复修改直到通过
    2、多种解法比较，把自己提交的写法进行优化

第三遍：
    1、一天之后，把昨天做过的题重新做一遍
    2、对不同解法的熟练度进行专项练习

第四遍：
    1、一周之后，把昨天做过的题重新做一遍
    2、对不同解法的熟练度进行专项练习

第五遍：
    1、面试前一周返回来练习
```