# Shell工具与脚本

1. 阅读 ``man ls`` ，然后使用 ``ls`` 命令进行如下操作：

   — 所有文件（包括隐藏文件）

   ```sh
   $ ls -al
   总用量 12
   drwxrwxr-x 2 shaozk shaozk 4096 6月   2 15:15 .
   drwxrwxr-x 5 shaozk shaozk 4096 6月   2 15:13 ..
   -rw-rw-r-- 1 shaozk shaozk   24 6月   2 15:13 shell-tools.md
   
   # ls 	列出目录中存在对的文件和文件夹
   # -a	全部列出（包含隐藏文件）
   # -l	以详细列表形式列出
   ```
   
   — 文件打印以人类可以理解的格式输出（例如：使用454M，而不是454279954）
   
   ```sh
   $ ls -lh
   总用量 12K
   drwxrwxr-x 2 shaozk shaozk 4.0K 6月   2 15:15 .
   drwxrwxr-x 5 shaozk shaozk 4.0K 6月   2 15:13 ..
   -rw-rw-r-- 1 shaozk shaozk   24 6月   2 15:13 shell-tools.md
   
   # -h	以人可读方式输出，以K M G单位显示文件大小，需配合-l或-s使用
   ```
   
   — 文件以最近访问顺序排序
   
   ```sh
   $ ls -alt
   总用量 12
   drwxrwxr-x 2 shaozk shaozk 4096 6月   2 15:26 .
   -rw-rw-r-- 1 shaozk shaozk  783 6月   2 15:23 shell-tools.md
   drwxrwxr-x 5 shaozk shaozk 4096 6月   2 15:13 ..
   
   # -t	按照时间排序，最新的在最前面
   ```
   
   — 以彩色文本显示输出结果
   
   ```sh
   $ ls -al --color
   总用量 12
   drwxrwxr-x 2 shaozk shaozk 4096 6月   2 15:26 .
   drwxrwxr-x 5 shaozk shaozk 4096 6月   2 15:13 ..
   -rw-rw-r-- 1 shaozk shaozk  783 6月   2 15:23 shell-tools.md
   
   # --color	以彩色文本显示输出结果
   ```



2. 编写两个bash函数 ``marco`` 和 ``poolo`` 执行下面的操作。每当执行 ``marco`` 时，当前的目录应当以某个形式保存，当执行 ``polo`` 时，无论现在处在什么目录下，都应当 ``cd`` 回到当时执行``macro`` 的目录。

```sh
# marco.h
# Tips:使用变量gdir存储当前目录

#!/bin/bash

marco () {
	gdir="$(pwd)" || exit
	echo "marco $(pwd)"
}

polo () {
	cd "$gdir" || exit
	echo "polo $gdir"
}
```

```sh
# 测试
$ pwd
/sys
$ marco
marco /sys
$ cd /usr
$ pwd
/usr
$ polo
polo /sys
$ pwd
/sys
```



3. 假设您有一个命令，它很少出错。因此为了在出错时能够对其进行测试，需要花费大量的时间重现错误并捕获输出。编写一段bash脚本，运行如下的脚本直到它出错，将它的标准输出和标准错误流记录到文件，并在最后输出所有内容。

```sh
# finderr.sh

#!/usr/bin/env bash

bugsh="$1"
log="log.txt"; > "$log"	# clear file
cnt=0
ret=0

echo "Start run $bugsh ..."

while [[ $ret -ne 1 ]]
do
	bash "$bugsh" >> "$log" 2>> "$log"; ret=$?
	cnt=$(("$cnt"+1))
	echo "Exec bash $bugsh $cnt"
done

echo "Finish run $bugsh"
echo "Total: $cnt"
echo "Log file: $log"

```

```sh
# 测试
$ ./finderr.sh err.sh 
Start run err.sh ...
Exec bash err.sh 1
Exec bash err.sh 2
Exec bash err.sh 3
Exec bash err.sh 4
Exec bash err.sh 5
Exec bash err.sh 6
Exec bash err.sh 7
Exec bash err.sh 8
Exec bash err.sh 9
Exec bash err.sh 10
Exec bash err.sh 11
Finish run err.sh
Total: 11
Log file: log.txt
$ cat log.txt 
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Everything went according to plan
Something went wrong
The error was using magic numbers
```



4. 您的任务是编写一个命令，它可以递归地查找文件夹中所有的HTML文件，并将它们压缩成zip文件。注意，即使文件名中包含空格，您的命令也应该能够正确执行。

```sh
# ziphtml.sh

#!/usr/bin/env bash

dir=$1
htmlsuffix="*.html"
zipname="html.zip"

if [ ! -n "$dir" ]; then
	echo "usage: ziphtml.sh [directory]"
	exit
fi

find "$dir" -name "$htmlsuffix" -type f | xargs zip "$zipname" -r

# find	查找文件
# -name	pattern	指定文件名（可以是模式匹配）
# -type	f	指定查找类型为常规文件
# xargs	执行来自标准输入的命令


```



5. （进阶）编写一个命令或脚本递归查找文件夹中最近使用的文件。更通用的做法，你可以按照最近的使用时间列出文件码？

```sh
# findused.sh

#!/usr/bin/env bash

dir=$1

if [ ! -n "$dir" ]; then
	echo "usage: "$0" [directory]"
	exit
fi

find "$dir" -type f -print0 | xargs -0 ls -lt

# -print0 输出完整文件名，用空字符（而不是换行符）连接；这个选项对应xargs中的-0选项
```



