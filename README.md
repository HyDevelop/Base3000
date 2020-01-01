<h1 align="center">
  <br>
  <br>
  数字缩短工具 | 三千进制
  <h4 align="center">
  Chinese Number Compressor | Base 3000
  </h4>
  <h5 align="center">
<a href="#usage">使用</a>&nbsp;&nbsp;
<a href="#info">概念</a>&nbsp;&nbsp;
<a href="#license">开源条款</a>
</h5>
  <br>
  <br>
  <br>
</h1>

<a name="usage"></a>
使用方法 | Usage
---------

1. 转到 https://b3k.hydev.org/
2. 如果要把数字转换到 b3k, 在左边输入数字w
3. 如果要把 b3k 转回数字, 在右边输入 b3k.

### In English:

1. Goto https://b3k.hydev.org/
2. If you want to convert decimal to b3k, enter number on the left.
3. If you want to convert b3k back to decimal, enter b3k on the right.

<a name="info"></a>
概念 | Info
---------

这个程序使用了最常用的 3000 个中文字符来把一串十进制很长的一串数字缩短到几个中文字符w<br>
(字符常用性参考: http://lingua.mtsu.edu/chinese-computing/statistics/char/list.php?Which=MO)<br>
在列表里面做了一些修改, 比如说把前 11 个字改成 "零" 到 "十" 什么的w<br>
完整列表 JSON 在[这里](src/base3000.json).

This program utilizes a list of 3000 most commonly used Chinese characters as digit bases to shorten very long numbers in base 10 into simply several Chinese characters in Base 3000. The original list can be found here: http://lingua.mtsu.edu/chinese-computing/statistics/char/list.php?Which=MO. There were some modifications to this list, mainly just to make the characters look nicer, like moving the characters that represent 0 (零) to 10 (十) to the index of 0 to 10 even though 0 (零) is not actually the most frequently used character. The complete json can be found [here](src/base3000.json).

<a name="license"></a>
开源条款 | License: [MIT](LICENSE)
---------
