编辑时间：2020年2月9日17:37:23
集数：


## BS4
> bs4库是什么，它的用途在哪，如何下载？如何使用？内置的解析器？它有哪些重要的api，如何用这个库实现元素查找

> 索引：
> bs4,下载，用途，中文文档，解析器，
> html=BeautifulSoup(htmlhandle,'lxml')
> find_all('div',,limit=3)
> find_all('h3',class_='boxtitle')
> find_all('h3',attrs={'class','boxtitle'})
> html.string
> html.strings
> html.stripped_strings
> html.get_text



1. **下载**
> pip install bs4


2. **它用途与介绍**
> bs4全称为BeautifulSoup4。它的作用是用于数据（html，xml文档的解析工具）的处理，是lxml的升级版。它比较简单，但是效率低。
>
3. **bs4的中文文档**
> 在github中搜索关键词bs4，获得中文文档
>
> `https://www.crummy.com/software/BeautifulSoup/bs4/doc/index.zh.html`

4. **bs4中所使用的解析器**

| 解析器                 | 使用方法                             | 优势                                                         | 劣势            |
| ---------------------- | ------------------------------------ | ------------------------------------------------------------ | --------------- |
| Python标准库           | BeautifulSoup(markup, “html.parser”) | Python的内置标准库执行速度适中文档容错能力强 Python 2.7.3 or 3.2.2)前 的版本中文档 | 容错能力差      |
| lxml HTML 解析器（！） | BeautifulSoup(markup, “lxml”)        | 速度快文档容错能力强                                         | 需要安装C语言库 |
|lxml XML 解析器|BeautifulSoup(markup, [“lxml”, “xml”])BeautifulSoup(markup, “xml”)|速度快唯一支持XML的解析器|需要安装C语言库
|html5lib|BeautifulSoup(markup, “html5lib”)|最好的容错性以浏览器的方式解析文档生成HTML5格式的文档|速度慢不依赖外部扩展|

5. **bs4中的api，find_all()使用，以及解析器导入（find（x）==find_all(x,limit=1)）**
```python
from bs4 import BeautifulSoup
#从本地导入html文件
htmlfile = open('test.html', 'r', encoding='utf-8')
#读取对象
htmlhandle = htmlfile.read()
#使用lxml的解析器（一般都用这个）
html=BeautifulSoup(htmlhandle,'lxml')

#获得所有的div的元素。限制输出3个
elements1=html.find_all('div',,limit=3)
#print(elements1)

#找到h3标签，类名为boxtitle
elements2=html.find_all('h3',class_='boxtitle')
print(elements2)

#找到h3标签，类名为boxtitle
elements3=html.find_all('h3',attrs={'class','boxtitle'})
print(elements3)

#>>>[<h3 class="boxtitle">吊装带厂家列表</h3>]
#>>>[<h3 class="boxtitle">吊装带厂家列表</h3>]
```


4. **bs4方法获得对象属性** 
> 由于lxml中的解析器默认采用xml解析器，因此解析html的时候，可能会发生错误，因此建议最好自己定义html的解析器

```python
from bs4 import BeautifulSoup
#从本地导入html文件
htmlfile = open('test.html', 'r', encoding='utf-8')
#读取对象
htmlhandle = htmlfile.read()
html=BeautifulSoup(htmlhandle,'lxml')

elements2=html.find_all('h3',class_='boxtitle')[0]
print(elements2)
print(elements2['class'])

# >>><h3 class="boxtitle">吊装带厂家列表</h3>
#>>>['boxtitle']
```
5.**关于获得标签文本的4个方法，string，strings，stripped_strings，get_text**
```python
from bs4 import BeautifulSoup
htmlhandle="""
<div class='haha'>
    亚丝娜
    <div>刀剑神域
        <a href='ffff'>我是a标签</a>
    </div>
</div>
"""
html=BeautifulSoup(htmlhandle,'lxml')

print(html.string)#获得标签的首行字符串
print(list(html.strings))#获得该标签下的所有子孙字符串（列表输出）
print(list(html.stripped_strings))#获得该标签下的所有（非空）子孙字符串（列表输出）
print(html.get_text)#获得该标签下的所有字符串（有问题！！建议不要使用）

#>>>None

#>>>['\n    亚丝娜\n    ', '刀剑神域\n        ', '我是a标签', '\n', '\n', '\n']

#>>>['亚丝娜', '刀剑神域', '我是a标签']

#>>><bound method Tag.get_text of <html><body><div class="haha">
#>>>    亚丝娜
#>>>    <div>刀剑神域
 #>>>       <a href="ffff">我是a标签</a>
#>>></div>
#>>></div>
#>>></body></html>>

\

```
## 手写笔记
![acfe201878afe412056422ae16a94ab6.png](en-resource://database/1339:1)