# Collections 类解析

> 作用：Java 为操纵 List、Set、Map 提供的工具类。

Collections 类的方法可以分为以下几类：

- 排序
- 查找
- 同步
- 元素操纵
- 集合转换
- 集合检查

------

## __1.  排序__

| 方法                                                         | 作用                                                    |
| ------------------------------------------------------------ | ------------------------------------------------------- |
| void sort(List, Comparator)<br/>void sort(List)              | 根据指定 Comparator 或自然顺序排序                      |
| Comparator reverseOrder(Comparator)<br/>Comparator reverseOrder() | 根据指定 Comparator 或自然顺序获得一个倒序的 Comparator |
| void reverse(List)                                           | 将 List 中所有元素倒序                                  |
| void shuffle(List)<br/>void shuffle(List, Random)            | 打乱 List 中元素的顺序                                  |

## __2.  查找__

| 方法                                                         | 作用                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Object min(Collection, Comparator)<br/>Object min(Collection) | 按照指定 Comparator 或者自然顺序查找并返回最小值             |
| Object max(Collection, Comparator)<br/>Object max(Collection) | 按照指定 Comparator 或自然顺序查找并返回最大值               |
| int binarySearch(List, Object, Comparator)<br/>int binarySearch(List, Object) | 按照指定 Comparator 或默认比较器查找 List 中的特定元素，返回其下标 |
| int indexOfSubList(List, List)                               | 返回子 List 在源 List 中的第一个位置                         |
| int lastIndexOfSubList(List, List)                           | 返回子 List 在源 List 中的最后一个位置                       |
| boolean disjoint(Collection, Collection)                     | 如果两个集合中没有相同的元素，返回 true                      |



## __3.  同步__

| 方法                                                | 作用                                     |
| --------------------------------------------------- | ---------------------------------------- |
| Collection synchronizedCollection(Collection)       | 使线程不安全的 Collection 具有同步能力   |
| Set synchronizedSet(Set)                            | 使线程不安全的 Set 具有同步能力          |
| List synchronizedList(List)                         | 使线程不安全的 List 具有同步能力         |
| Map synchronizedMap(Map)                            | 使线程不安全的 Map 具有同步能力          |
| NavigableMap synchronizedNavigableMap(NavigableMap) | 使线程不安全的 NavigableMap 具有同步能力 |
| NavigableSet synchronizedNavigableSet(NavigableSet) | 使线程不安全的 NavigableSet 具有同步能力 |
| SortedMap synchronizedSortedMap(SortedMap)          | 使线程不安全的 SortedMap 具有同步能力    |
| SortedSet synchronizedSortedSet(SortedSet)          | 使线程不安全的 SortedSet 具有同步能力    |

> 注释：synchronized方法都是通过复制元素到一个新的同步集合来实现同步。

## __4. 元素操纵__

| 方法                                     | 作用                                                         |
| ---------------------------------------- | ------------------------------------------------------------ |
| boolean replaceAll(List, Object, Object) | 替换 List 中的特定元素                                       |
| void copy(List, List)                    | 将一个 List 的所有元素复制到另一个 List 中                   |
| void fill(List, Object)                  | 填充特定 Object 到 List 中                                   |
| List nCopies(int, Object)                | 返回一个填充了特定元素 Object 的 List ，长度为 n             |
| void swap(List, int, int)                | 交换 List 中两个下标的元素                                   |
| boolean addAll(Collection, Object[])     | 添加 Object[] 中所有元素到 Collection 中                     |
| void rotate(List, int)                   | 将一个 List 旋转 i 个长度。i 为正数向前旋转（后面元素移到开头），反之后移 |
| int frequency(List, Object)              | 统计 List 中 Object 出现的个数，Object 可以为 null           |
| Set singleton(Object)                    | 返回只包含一个元素的 Set                                     |
| List singletonList(Object)               | 返回只包含一个元素的 List                                    |
| Map singletonMap(Object)                 | 返回只包含一个键值对的 Map                                   |

> 注释： singleton方法返回一个只包含一个元素的 Set 或 List 或 Map。假如要删除 List 中所有值为 1 的元素，removeAll() 方法的参数是 Collection<?> ，传入一个 singletonSet （或 List 或 Map）比传入一个新的 Set（或 List 或 Map）要节省内存。

## __5. 集合转换__

| 方法                                          | 作用                                                         |
| --------------------------------------------- | ------------------------------------------------------------ |
| Enumeration emptyEnumeration()                | 返回一个空的 Enumeration，不能对其进行任何结构性修改的操作   |
| List emptyList                                | 返回一个空的 emptyList，不能对其进行任何结构性修改的操作     |
| Map emptyMap                                  | 返回一个空的 emptyMap，不能对其进行任何结构性修改的操作      |
| Set emptySet                                  | 返回一个空的 emptySet，不能对其进行任何结构性修改的操作      |
| SortedMap emptySortedMap                      | 返回一个空的 emptySortedMap，不能对其进行任何结构性修改的操作 |
| SortedSet emptySortedSet                      | 返回一个空的 emptySortedSet，不能对其进行任何结构性修改的操作 |
| Navigablemap emptyNavigableMap                | 返回一个空的 emptyNavigableMap，不能对其进行任何结构性修改的操作 |
| NavigableSet emptyNavigableSet                | 返回一个空的 emptyNavigableSet，不能对其进行任何结构性修改的操作 |
| EMPTY_SET（final域）                          | 返回一个空的 emptySet，但不支持泛型                          |
| EMPTY_LIST（final域）                         | 返回一个空的 emptyList，但不支持泛型                         |
| EMPTY_MAP（final域）                          | 返回一个空的 emptyMap，但不支持泛型                          |
| Iterator emptyIterator()                      | 返回一个空的 Iterator，不能进行遍历和修改                    |
| ListIterator emptyListIterator()              | 返回一个空的 ListIterator，不能进行遍历和修改                |
| Set<E> newSetFromMap(Map<E,Boolean>)          | 以特定的 Map 返回一个 Set                                    |
| ArrayList list(Enumeration)                   | 将一个枚举集合转换为 ArrayList                               |
| Enumeration enumeration(Collection)           | 将一个集合转换为 Enumeration                                 |
| Queue asLifoQueue(Deque)                      | 返回一个栈形式的队列                                         |
| List unmodifiableList(List)                   | 返回一个不能进行结构性修改的 List                            |
| Collection unmodifiableCollection(Collection) | 返回一个不能进行结构性修改的 Collection                      |
| Map unmodifiableMap(Map)                      | 返回一个不能进行结构性修改的 Map                             |
| SortedMap unmodifiableSortedMap(SortedMap)    | 返回一个不能进行结构性修改的 SortedMap                       |
| SortedSet unmodifiableSortedSet(SortedSet)    | 返回一个不能进行结构性修改的 SortedSet                       |

> 注释：empty集合的作用：当函数需要返回一个空的集合时，通常有两种做法：返回一个新集合或者返回null。但这两种做法都有缺点：返回新集合耗费额外的内存；返回null需要调用者进行判空操作。因此empty集合的作用在于，返回一个大小为 0 的集合而且不耗费内存。
>
> newSetFromMap 要求传入一个键值对类型为 <E, Boolean> 的空 Map。返回的 Set 与 Map 性能一致，也就是说可以传入一个 ConcurrentHashMap 来获得一个有同步性能的 "ConcurrentHashSet"。
>
> Enumeration 是一个接口，通过接口方法可以枚举对象集合中的元素。但 Enumeration 接口已被 Iterator 取代，很少使用。尽管如此，它还是使用在 Vector 和 Properties 这些传统类中。
>
> 结构性修改是指：不能增加、删除、修改、排序。



## __5. 集合检查__

| 方法                                                         | 作用                              |
| ------------------------------------------------------------ | --------------------------------- |
| Collection checkedCollection(Collection, Class)              | 返回一个已检查类型的集合          |
| List checkedList(List, Class)                                | 返回一个已检查类型的 List         |
| Map checkedMap(Map, Class, Class)                            | 返回一个已检查类型的 Map          |
| Queue checkedQueue(Queue, Class)                             | 返回一个已检查类型的 Queue        |
| Set checkedSet(Set, Class)                                   | 返回一个已检查类型的 Set          |
| SortedMap checkedSortedMap(SortedMap, Class, Class)          | 返回一个已检查类型的 SortedMap    |
| SortedSet checkedSortedSet(SortedSet, Class)                 | 返回一个已检查类型的 SortedSet    |
| NavigableMap checkedNavigableMap(NavigableMap, Class, Class) | 返回一个已检查类型的 NavigableMap |
| NavigableSet checkedNavigableSet(NavigableMap, Class)        | 返回一个已检查类型的 NavigableSet |

> 注释：checked方法不会检查原集合中已插入的元素类型，而是检查将来插入的元素对象是否符合指定的类型。比如：有一个 Object 类型的 list，包含 String 类型和 Integer 类型的元素。若执行 checkedList(list,String.class)获得一个视图 checkedList，那么再往 checkedList 中插入 Integer 类型元素时，将抛出 ClassCastException。

