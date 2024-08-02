# TinySTL
>   STL ソースを学び、小さな STL を達成します。

大量程序员被迫从事大量重复的工作，竟是为了完成前人早已完成而自己手上并未拥有的程序代码。

## script

```bash
mkdir /e/project/04_flyMe2theStar/02_TinySTL/test /e/project/04_flyMe2theStar/02_TinySTL/test/build
cp /e/project/04_flyMe2theStar/02_TinySTL/src/* /e/project/04_flyMe2theStar/02_TinySTL/test/
cd /e/project/04_flyMe2theStar/02_TinySTL/test/build
cmake /e/project/04_flyMe2theStar/02_TinySTL/test/CMakeLists.txt
make

rm -r /e/project/04_flyMe2theStar/02_TinySTL/test
```

## nice try

1.   `4.2 vector`，`4.3 list`，`5.9 hash_map`，`5.8 hash_set`，`5.2 red-black-tree`，`5.4 map`

2.   `allocator`，`iterator`，`base function`，`container`，`algorithm`

     **base function**：

     ```bash
     uninitialized_copy
     uninitialized_copy_n
     uninitialized_fill
     uninitialized_fill_n
     uninitialized_move
     uninitialized_move_n
     
     copy
     copy_backward
     move
     move_backward
     fill
     fill_n
     
     swap
     min
     max
     ```

## tree

```bash
|-- CMakeLists.txt
|-- main.cpp
|-- stl_algo.h
|-- stl_algobase.h
|-- stl_alloc.h
|-- stl_config.h
|-- stl_construct.h
|-- stl_function.h
|-- stl_hash_fun.h
|-- stl_hash_map.h
|-- stl_hash_set.h
|-- stl_hashtable.h
|-- stl_iterator.h
|-- stl_iterator_base.h
|-- stl_list.h
|-- stl_map.h
|-- stl_pair.h
|-- stl_tree.h
|-- stl_uninitialized.h
|-- stl_vector.h
`-- type_traits.h
```

## ex license

```c++
/*
 *
 * Copyright (c) 1994
 * Hewlett-Packard Company
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.  Hewlett-Packard Company makes no
 * representations about the suitability of this software for any
 * purpose.  It is provided "as is" without express or implied warranty.
 *
 *
 * Copyright (c) 1996,1997
 * Silicon Graphics Computer Systems, Inc.
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.  Silicon Graphics makes no
 * representations about the suitability of this software for any
 * purpose.  It is provided "as is" without express or implied warranty.
 */
```

## references

1.   STL 源码剖析（The Annotated STL Sources），侯捷
1.   [教材 SGI STL 源码参考](https://github.com/steveLauwh/SGI-STL.git)
1.   [怎么写自己的 CMakeLists.txt](https://www.cnblogs.com/chaofn/p/10160555.html)
