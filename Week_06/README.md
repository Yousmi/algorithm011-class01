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

##### 动态规划 Dynamic Programming
-  Simplifying a complicated problem by breaking it down into simpler sub-problems
-  Divide&Conquer + Optiomal substructure (分治 + 最优子结构)

- 关键点
  - 动态规划和 递归或者分治没有根本上的区别（关键看有无最优的子结构）
  - 共性： 寻找重复的子问题
  - 差异：最优子结构、中途可以淘汰次优解