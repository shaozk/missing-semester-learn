# 编辑器（Vim)

1. 完成vimtutor

```sh
$ vimtutor

# Tips:一步步跟着教程做就好了。	
```



2. 下载课程提供的 [vimrc](https://missing-semester-cn.github.io/2020/files/vimrc)，然后把它保存到 ``~/.vimrc`` 。通读这个注释详细的文件，然后观察Vim在这个新的设置下看起来和使用有哪些细微区别。

```sh
$ vim ~/.vimrc

# set nocompatible						关闭Vim出于历史兼容性考虑而设置vi模式
# syntax on								语法高亮打开
# set shortmess+=I						关闭默认Vim打开的信息
# set number							显示行号
# set relativenumber					显示相对行号（游标所在行显示）
# set laststatus=2						总是在底部显示状态栏
# set backspace=indent,eol,start		
# set hidden							隐藏缓存
# set ignorecase						查找时大小写无关
# set smartcase							全小写时大小写无关，存在大写字母时大小写相关
# set incsearchh						当你键入字符时搜索（而不是最后输入回车键时）
# set noerrorbells visualbell t_vb=		无响铃
# set mouse+=a							鼠标使能
# nnoremap <Left>	:echoe "Use h"<CR>	屏蔽方向左键，并添加错误提示信息
# nnoremap <Right>	:echoe "Use l"<CR>	屏蔽方向右键
# nnoremap <Up>		:echoe "Use k"<CR>	屏蔽方向上键
# nnoremap <Down>	:echoe "Use j"<CR>	屏蔽方向下键

```



3. 安装和配置一个插件：[ctrip.viim](https://github.com/ctrlpvim/ctrlp.vim) :
   * 用 ``mkdir -p ~/.vim/pack/vendor/start`` 创建文件夹
   * 下载这个插件 ``cd ~/.vim/pack/vendor/start; git clone https://github.com/ctrlpvim/ctrlp.vim`` 
   * 阅读这个插件的[文档](https://github.com/ctrlpvim/ctrlp.vim/blob/master/readme.md) 。尝试用 CtrlP 来在一个工程文件夹里定位一个文件，打开 Vim，然后用 Vim 命令控制行开始：``CtrlP`` 。
   * 自定义 CtrlP：添加configuration 到你的 ``~/.vimrc`` 来用按 Ctrl-P 打开 CtrlP

```sh
$ mkdir -p ~/.vim/pack/vendor/start
$ cd ~/.vim/pack/vendor/start/
$ git clone https://github.com/ctrlpvim/ctrlp.vim
正克隆到 'ctrlp.vim'...
remote: Enumerating objects: 4299, done.
remote: Counting objects: 100% (168/168), done.
remote: Compressing objects: 100% (105/105), done.
remote: Total 4299 (delta 71), reused 147 (delta 62), pack-reused 4131
接收对象中: 100% (4299/4299), 1.70 MiB | 2.31 MiB/s, 完成.
处理 delta 中: 100% (1661/1661), 完成.

# CtrlP使用
# 使用 :CtrlP 或 <Ctrl+P> 进入文件搜索模式

# 常用命令
# <c-f>/<c-b>			切换模式：files/mru files/buffers
# <c-d>					只匹配文件名，不匹配文件夹/路径名
# <c-r>					正则表达式(regexp)
# <c-j>,<c-k>			控制游标在结果列表中上下移动
# <c-t>/<c-v>,<c-x>		在新的标签页或分割页打开
# <c-n>,<c-p>			命令行历史记录中选择上一个或下一个命令
# <c-y>					创建新文件（似乎不起作用）
# <c-z>					标记多行后用<c-o>可同时打开他们

```



4. 练习使用 Vim，在你自己的机器上重做演示。

```sh
import sys

def fizz_buzz(limit):
	for i in range(1, limit+1):
		if i % 3 == 0:
			print('fizz', end='')
		if i % 5 == 0:
			print('buzz', end='')
		if i % 3 and i % 5:
			print(i)

def main():
	fizz_buzz(int(sys.argv[1]))

	
if __name__ == '__main__':
	main()

```



5. 用 Vim 完成所有的文件编辑。

```sh
# Tips:需要自己在之后的工作中使用Vim
```



6. 在其他工具中设置 Vim 快捷键。

```sh
# Shell
$ set -o vi

# Tips:Shell默认处于Insert模式
```



7. 进一步自定义你的 ``~/.vimrc`` 和安装更多插件。

```sh
# ack.vim 代码搜索
$ sudo apt install ack		# ack(>=2.0) required
$ git clone https://github.com/mileszs/ack.vim.git ~/.vim/pack/vendor/start/ack.vim

# 快捷键
# ?		快捷键简介，重按退出
# o		打开
# O		打开后关闭快捷窗口
# go	预览文件，打开后仍聚焦搜索结果
# t		在新窗口打开
# T 	在新窗口打开但不移过去
# h		在水平分割页打开
# H		在水平分割页打开，但仍聚焦搜索结果
# v		在垂直分割页打开
# gv 	在垂直分割页打开，但仍聚焦搜索结果
# q		退出快捷窗口

# nerdtree 文件浏览器
$ git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
$ vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

# vim-easymotion 魔术操作
$ git clone https://github.com/easymotion/vim-easymotion.git ~/.vim/pack/plugins/start/vim-easymotion
```



8. （高阶）用 Vim 宏将 XML 转换到 JSON ([例子文件](https://missing-semester-cn.github.io/2020/files/example-data.xml))。

```sh
# 宏
# - q{字符}		开始在寄存器{字符}中录制宏
# - q			 停止录制
# - @{字符}		重放宏

# Tips:按照宏章节所提供的示例操作即可。
```

