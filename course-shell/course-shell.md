# 课程概览与Shell

1. 使用 ``echo $SHELL`` 命令查看 shell 。

```sh
$ echo $SHELL
/bin/bash
```

2. 在 ``/tmp`` 下新建一个名为 ``missing`` 的文件夹。

```sh
$ cd /tmp
$ mkdir missing

# 为了方便记录，将course-shell文件夹视作/tmp文件夹，下同。
```

3. 用 ``man`` 查看程序 ``touch`` 的使用手册。

```sh
$ man touch
...
TOUCH(1)                        User Commands                        TOUCH(1)

NAME
       touch - change file timestamps

SYNOPSIS
       touch [OPTION]... FILE...

DESCRIPTION
       Update  the  access and modification times of each FILE to the current
       time.

       A FILE argument that does not exist is created empty, unless -c or  -h
       is supplied.

...
```

4. 用 ``touch`` 在 ``missing``的文件夹下新建一个叫 ``semester`` 的文件。

```sh
$ cd missing
$ touch semester
$ ls
semester
```

5. 将以下内容一行一行地写入 ``semester`` 文件：

```sh
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
```

注意：``#`` 在 Bash 中表示注释，而 ``!`` 即使被双引号（``"``）包裹也具有特殊的含义。单引号（``'``）则不一样。

```sh
$ echo '#!/bin/sh' > semester 
$ echo 'curl --head --silent https:://missing.csail.mit.edu' >> semester 
$ cat semester 
#!/bin/sh
curl --head --silent https:://missing.csail.mit.edu
```

6. 尝试执行这个文件。

```sh
$ ./semester
$ ls  -l
总用量 4
-rw-rw-r-- 1 shaozk shaozk 62 5月  29 23:15 semester

# 无可执行权限
```

7. 查看 ``chmod`` 手册。

```sh
$ man chmod
...
CHMOD(1)                        User Commands                        CHMOD(1)

NAME
       chmod - change file mode bits

SYNOPSIS
       chmod [OPTION]... MODE[,MODE]... FILE...
       chmod [OPTION]... OCTAL-MODE FILE...
       chmod [OPTION]... --reference=RFILE FILE...

DESCRIPTION
       This  manual  page  documents the GNU version of chmod.  chmod changes
       the file mode bits of each given file according to mode, which can  be
       either  a symbolic representation of changes to make, or an octal num‐
       ber representing the bit pattern for the new mode bits.

...
```

8. 使用 ``chmod`` 命令改变权限，使 ``./semester`` 能够成功执行，不要使用 ``sh semester`` 来执行该程序。

```sh
$ chmod +x semester
$ ls -l
总用量 4
-rwxrwxr-x 1 shaozk shaozk 62 5月  29 23:15 semester
$ ./semester
```

9. 使用 ``|`` 和 ``>`` ，将 ``semester`` 文件输出的最后更改日期信息，写入主目录下的 ``last-modified.txt`` 的文件中。

```sh
$ ls --full-time | grep semester | cut -d ' ' -f6-8 > last-modified.txt
$ ls
last-modified.txt  semester
$ cat last-modified.txt 
2024-05-29 23:15:17.304977700 +0800

```

10. 写一段命令来从 ``/sys`` 中获取笔记本的电量信息，或者台式机 CPU 的温度。

```sh

```

