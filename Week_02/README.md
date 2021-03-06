#####学习笔记
课后作业
```
1、写一个关于 HashMap 的小总结。
    说明：对于不熟悉 Java 语言的同学，此项作业可选做。
2、
```

一、哈希表、映射、集合

哈希表
- 根据关键码值而直接访问的数据结构，通过把关键码值映射到表中的一个位置来访问记录，以加快查找的速度
- 这个映射函数叫作散列函数，存放记录的数组叫做哈希表

散列函数
  * 算出的函数需要是非整数
  * 相同的输入，输出也相同
  * 不同的输入，输出也不相同

哈希碰撞
 * 不同的关键值码，在经过散列函数进行操作后，有可能形成相同的下标，这就形成了hash碰撞
 * 解决hash 冲突的方法有 ： 
   * 开发寻址发：
     * 继续顺序探测没存数据的位置，然后存储
   * 链表法：
     * 在冲突的位置做为一个链表，来存储相关的发生了散列冲突的值

装载因子
当散列表的剩余空间不足时，发生的散列冲突概率就越大; 当散列函数设计不合理时，散列冲突概率就越大
解决空间不足时的方法是引入转载因子，当插入一个数时，所使用的空间操过转载因子时，我们就手动给其扩容
一般这个数是 0.75

---

在iOS中，所用的<kbd>key-value</kbd>结构，是<kbd>NSDictionary</kbd> <kbd>NSMapTable</kbd>,在ObjC下，字典又分为可变和非可变；在Swift下，只要用 <kbd>var</kbd>关键字定义的都是可变的
```c++
NSDictionary 和 NSMapTable
相同点：都是 key-value 结构
不同点：
    NSDictionary 对key或者value都是强引用
    NSMapTable 可设置key或者value的强弱引用关系，支持弱引用
```
https://opensource.apple.com/source/CF/CF-1153.18/ 可查看相对底层一些的相关内容
https://www.cnblogs.com/zhaoguowen/p/4273237.html 可查看一些集合类的对比情况
https://developer.apple.com/documentation/foundation/collections?language=objc 查看苹果总结的 Collections 

在iOS中，集合使用最多的恐怕是<kbd>NSArray</kbd>和它的派生类<kbd>NSMutableArray</kbd>,其实iOS中还有一些是集合对象，各自有些不同的特点
比如说：
1、<kbd>NSSet</kbd>和<kbd>NSMutableSet</kbd> <kbd>NSCountedSet</kbd>
2、<kbd>NSOrderedSet</kbd>和<kbd>NSMutableOrderedSet</kbd>
3、<kbd>NSHashTable</kbd>
4、<kbd>NSArray</kbd>和<kbd>NSMutableArray</kbd>
5、<kbd>NSPointerArray</kbd>
6、<kbd>NSCache</kbd>
7、<kbd>NSIndexSet</kbd>和 <kbd>NSMutableIndexSet</kbd>
##### Basic Collections
    NSArray
        A static ordered collection of objects.
    NSMutableArray
        A dynamic ordered collection of objects.
    NSDictionary
        A static collection of objects associated with unique keys.
    NSMutableDictionary
        A dynamic collection of objects associated with unique keys.
    NSSet
        A static unordered collection of unique objects.
    NSMutableSet
        A dynamic unordered collection of unique objects.
##### Indexes
    NSIndexPath
        A list of indexes that together represent the path to a specific
        location in a tree of nested arrays.
    NSIndexSet
        An immutable collection of unique integer values that represent 
        indexes in another collection.
    NSMutableIndexSet
        A mutable collection of unique integer values that represent indexes 
        in another collection.
##### Specialized Sets
    NSCountedSet
        A mutable, unordered collection of distinct objects that may appear 
        more than once in the collection.
    NSOrderedSet
        A static, ordered collection of unique objects.
    NSMutableOrderedSet
        A dynamic, ordered collection of unique objects.
##### Purgeable Collections
    NSCache
        A mutable collection you use to temporarily store transient key-value
        pairs that are subject to eviction when resources are low.
    NSPurgeableData
        A mutable data object containing bytes that can be discarded when 
        they're no longer needed.
##### Pointer Collections
    NSPointerArray
        A collection similar to an array, but with a broader range of available 
        memory semantics.
    NSMapTable
        A collection similar to a dictionary, but with a broader range of 
        available memory semantics.
    NSHashTable
        A collection similar to a set, but with broader range of available
        memory semantics.
##### Iteration
    NSEnumerator
        An abstract class whose subclasses enumerate collections of objects, 
        such as arrays and dictionaries.
    NSFastEnumeration
        A protocol that objects adopt to support fast enumeration.
    NSEnumerationOptions
        Options for block enumeration operations.
    NSSortOptions
        Options for block sorting operations.
##### Special Semantic Values
    NSNull
        A singleton object used to represent null values in collection objects 
        that don’t allow nil values.
    NSNotFound
        A value indicating that a requested item couldn’t be found or doesn’t 
        exist.

---
树、二叉树、二叉搜索树

树：可由双向链表进化而来，有多个next指针
二叉树：只有2个子节点的树结构
二叉搜索树:为空树，或者非空情况下的：左子树的值都小于根，又子树的值都大于根

树的遍历：
- 前序遍历
- 中序遍历
- 后序遍历

直接用递归调用来遍历就好：原因 ->树的定义没发用简单的迭代进行遍历

堆和二叉树、图
> 堆 Heap ： 可以快速查找一堆数中的最大或者最小值的数据结构
>> 根节点大的叫做大顶堆，小的叫小顶堆，常见的有二叉堆、斐波那契堆等

大顶堆的一些操作
> find-max: O(1)
> delete-max: O(logN)
> insert(create): O(logN) / O(1)

二叉堆性质
可通过完全二叉树来实现，不是二叉搜索树
二叉堆（大顶堆）满足一下性质
> 是一颗完全树
> 树中的任意节点的值总是 >= 其子节点的值

实现细节
> 1、二叉堆一般通过数组来实现
> 2、假设 第一个元素 在数组中的索引为 0 的话，则父节点和子节点的位置有如下关系：
>> a、索引为 i 的左孩子的索引是 2*i + 1
>> b、索引为 i 的右孩子的索引是 2*i + 2
>> c、索引为 i 的父孩子的索引是 floor((i - 1)/2)

insert 操作
> 1、新元素一律插入到堆的尾部
> 2、依次向上调整整个对的结构，直到根节点

Delete Max 删除操作
> 1、将堆尾元素替换到顶部（相当于删除了）
> 2、依次从根部向下调整整个堆的结构，一直到堆尾即可