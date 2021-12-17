# CS1958 程序设计与数据结构Ⅰ Lab3

## 12.17新增：
**更新内容**:
1. 最终评分所使用的测试脚本
2. 由于评分脚本提供时间较晚，截止时间修改为12.19 23：59。
3. 第16周也可以答辩，但会按照迟交惩罚规则进行相应扣分(扣分数量取决于你选择的commit时间比ddl迟的天数)。

**请保证你的电脑中安装了valgrind**

评分脚本使用方法：
1. 下载grade.sh到相应目录下(与vector.hpp在同一目录下)
2. 在你的工作目录下(例如，我的工作目录是~/cpp/CS1958-Lab3)，执行`chmod 777 ./grade.sh`
3. 在你的工作目录下执行`./grade.sh`，如果结果如下，恭喜通过测试！(注：第一行为所执行的命令)

**注：若出现类似"7c7"的输出，表示你的输出第7行与`answer.txt`不一致；若未输出`0 leak 0 error`，表示你的内存泄露检测未通过。**
```shell
qqqqxxx@DESKTOP-M6D01OA:~/cpp/CS1958-Lab3$ ./grade.sh
-------------------------Test One--------------------------
Testing for one... May take long...
Success test one!
Memory testing for one... May take long...
0 leaks
0 errors
-------------------------Test Two--------------------------
Testing for two... May take long...
Success test two!
Memory testing for two... May take long...
0 leaks
0 errors
------------------------Test Three-------------------------
Testing for three... May take long...
Success test three!
Memory testing for three... May take long...
0 leaks
0 errors
```

## 内容概要

本学期的第三项大作业要求同学们完成vector类的编写，其特性类似于stl中的vector。

**Credit to ACM Class.**

**Lab3的分数构成如下:**

1. 通过pipeline测试 (80%)
2. code review (20%)
3. **若code review中发现抄袭, 将废除pipeline测试得分**

实现代码的接口框架与头文件，助教已经给出。

同学们需要在截止日期前，完成Lab3的实现，并提交到 **github** 的仓库上。助教会在截止日期后一段时间内安排 Code Review。

关于快速开始，请点击“[快速开始](#快速开始)”。

关于本地测试，请点击“[如何测试你的代码](#如何测试你的代码)”。

关于在线评测，请点击“[在线评测方法](#在线评测)”。

关于迟交惩罚，请点击“[迟交惩罚](#迟交惩罚)”。

## 发布时间 & 截止时间

发布时间：第十二周周二(11月30日)

截止时间：**第十四周周五(12月17日) 22:00**

请大家严格把握好时间！建议尽早开工尽早完成！

## 文件说明

`CS1958-Lab3`文件夹下分别有数据和接口文件。

* **其中 `vector.hpp` 是你仅需要实现的文件，也是最终提交的代码。**

* `exceptions.hpp` 与 `utility.hpp` 是两个辅助文件 **(不可修改)**，提供了异常处理类与 pair 类，你可以在你的代码中自由使用。
* `data`文件夹中有多组测试数据，分别位于各个文件夹中 **(不可修改)**。其中标有 "memcheck" 的数据是用来进行**内存泄漏检查**的。

## 任务说明

补充完成一个 vector 类，你需要实现的接口有：

* 构造函数，析构函数
* 重载赋值运算
* 下标访问
* `front()`, `back()`, `empty()`, `size()`, `clear()`
* `insert`, `erase`
* `push_back()`, `pop_back()`
* 迭代器及其相关操作

测试数据比较宽松，请大家放心写代码。

## 如何测试你的代码？

以 vector 为例，若要在本地测试，请将你的代码 `vector.hpp`、相应测试点下的 cpp 文件 `code.cpp`  和 `class-bint.hpp`, `class-integer.hpp`, `class-matrix.hpp`, `utility.hpp`, `exceptions.hpp` 放在同一个目录下编译运行。

若要检测内存泄漏，请[使用 valgrind](Valgrind使用)。

## 在线评测

还没搭好...搭好后会在群里通知大家更新仓库。~~搭不好就手动评测了。~~

~~评测采用Github Actions的方式，请按照下述步骤新建自己的仓库，并在本地测试通过，或你认为需要的任意时刻将修改push到远程仓库中。评测结果可以在**Actions**内查看。~~

## 快速开始

1. 如果没有，[注册github账户](https://github.com/signup)。

2. 点击进入[lab3模板](https://github.com/q4x3/CS1958-Lab3)，找到绿色按钮**Use this template**并点击，填写仓库名(Repository name)，建议记住此时的仓库名和仓库名左侧的用户名。

3. 点击绿色**Create repository from template**来创建仓库。创建完毕后，点击白色**Code**按钮并复制网址。

4. 看向第五条之前，看看这个(本地已经安装并配置好git的同学可以跳过)。你需要先安装并配置git。判断是否已经安装git，请输入`git version`。在终端中输入以下命令以安装并配置git：
```bash
$ sudo apt-get install git
$ git config --global user.name "github用户名"
$ git config --global user.email "github邮箱"
```

4. 在终端中cd到你用来存放作业的文件夹(e.g.：`~/cpp`)，并执行以下指令：
```bash
$ git clone https://github.com/用户名/仓库名.git 或 git clone 你复制的网址
```

5. 现在，你的作业文件夹中应该已经出现了和仓库名同名的文件夹，动手实现吧！

6. 如果你实现的特别快，可以看看这里。依次输入以下命令以提交你的实现到github：
```bash
$ git add vector.hpp
$ git commit -m "关于这次提交的注释，推荐你认真写"
$ git push origin
```

7. 进入你的github仓库，进入Actions，查看在线评测结果。

## Valgrind安装及使用

1. 安装Valgrind。这相当简单，仅需在终端中运行：
```bash
$ sudo apt-get install valgrind
```

2. 编译出可执行文件，假设你的可执行文件名为code，请在终端中执行：
```bash
$ valgrind --tool-memcheck --leak-check=full ./code
```
执行结果参见最后一条输出**Error Summary**。

3. Mac用户的替代方案：[XCode内存泄漏检测工具Leaks](https://www.jianshu.com/p/b96b4bd61f9b)，当然你也可以选择安装[非官方的valgrind](https://github.com/LouisBrunner/valgrind-macos)，使用方法详见其readme。

## 迟交惩罚

**如有特殊情况不能在截止时间前完成提交，请主动提前联系助教，否则按迟交处理。**

在截止时间后第一天内提交，扣一分；在第二天内提交，扣两分……在第 i 天内提交，扣 i 分，扣完为止。

注意，此处扣分指**期末总评分数**。
