# pip上传

## 发布文件の结构

pip_case_wriper								# 主文件夹（起到包裹作用）
│  demos.py									# 演示文件
│  LICENSE										# 证书
│  README.md								# 软件说明
│  setup.py										#软件必备打包脚本
│
└─pip_case										#软件的包名称
    │  test.py									
    └─  \_\__init\_\__.py

### LICENSE

> 软件包的证书。最常见的是MIT，即开源

```PYTHON
The MIT License (MIT)

Copyright (c) 2021 许焕燃

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### README.md	

> 软件包的说明文件。包括不限于：软件的使用方法，下载方法等

### setup.py	

> pip打包工具规定的脚本文件。内部存放了打包的软件信息等。

```python
#!/usr/bin/env python
# coding=utf-8
import setuptools
with open("README.md", 'r',encoding='UTF-8') as f: #读取readme.md作为软件的长描述
    long_description=f.read()
setuptools.setup(
    name="pip_case", 									#软件包名称
    version='1.0',										#软件包版本号
    author="许焕燃",		
    author_email='527077832@qq.com',
    description="这是一个pip上传自定义包的测试包",			#简要描述
    long_description=long_description,					#详细描述
    long_description_content_type="text/markdown",		#详细描述的格式
    # url="https://ssl.xxx.org/redmine/projects/RedisRun", #模块的github地址
    packages=setuptools.find_packages(),					#所包含的包。通常使用自动查找就行
    classifiers=[										# 程序的所属分类列表
         "Development Status :: 3 - Alpha",
         "Topic :: Utilities",
         "License :: OSI Approved :: GNU General Public License (GPL)",
    ],
    install_requires=[									# 依赖的外部包
        'pillow'
    ],
    python_requires='>=3'								#	需要的版本号
)
```

## 执行打包

上述文件准备完毕后就可以开始打包

进入到cmd中，转入到pip_case_wriper文件下（外文件），执行以下代码

```cmd
python -m pip install --upgrade setuptools wheel(如有必要需要更新)
python setup.py sdist bdist_wheel
```

### 生成文件

> 打包完成后会生成3个文件

#### build

> 暂时不清楚

#### dist

> 核心文件

内部有两个文件

1. pip_case-1.0.tar.gz（这个文件就是打包后的核心）
2. pip_case-1.0-py3-none-any.whl

#### XXX.egg-info

> 内部房依赖

### xxx.tar.gz包含哪些？

```python
xxx(文件名)
│  LICENSE				#证书
│  PKG-INFO				#包的信息以及说明
│  README.md			#说明
│  setup.cfg
│  setup.py				#脚本文件
│
├─pip_case				#软件包
│      test.py
│      __init__.py
│
└─pip_case.egg-info		#软件包的附带信息
        dependency_links.txt
        PKG-INFO		#包的信息以及说明
        requires.txt	#包的依赖。可以使用pip install -r requires.txt下载
        SOURCES.txt		#整个包文件的资源列表
        top_level.txt	#最外层的文件
```



