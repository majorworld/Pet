Pet暂停维护，1.0版本AHK代码已开源，编译请携带作者信息，尊重劳动成果一下下。
====

也可以尝试Mouse+
https://gitee.com/majorworld/mouseplus

最新Pet版本号2.2
====
## 下载

[百度云盘](https://pan.baidu.com/s/1NXouguejZ4AW7TMAYU0lMw)

[腾讯微云](https://share.weiyun.com/5KCqeSw)

## 介绍

[小众软件](https://meta.appinn.net/t/pet/13605)

#### (1)首次启动会在Pet.exe同目录生成Pet.ini文件，里面有触发器的按键绑定配置和功能介绍。

#### (2)核心按【Space+E】【Space+D】【Space+S】【Space+F】控制鼠标光标上下左右移动

#### (3)核心按【CapsLock+I】【CapsLock+K】【CapsLock+J】【CapsLock+L】控制鼠标光标上下左右移动

#### (4)所有按键都可以通过Pet.ini文件修改和重新绑定

#### (5)为防止误触Pet禁用了CapsLock，按【Shift+CapsLock】切换大小写锁定功能。

#### (6)一共三种模式，Space热键模式，CapsLock方法模式和引号命令模式。

## 感谢

[感谢【*木】2020-02-07 21:31:35对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【*绍城】2020-02-23 13:25:21对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【*玉峰】2020-03-02 13:46:30对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【**飞】2020-03-07 12:59:45对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【*勇】2020-03-18 14:36:31对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【*张】2020-04-17 13:16:46对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【*。】2020-05-08 15:25:21对Pet的打赏](https://github.com/majorworld/Pet)

[感谢【A*s】2022-01-12 03:40:29对Pet的打赏](https://github.com/majorworld/Pet)

  

## 新增

#### (1)按【Space+1】【Space+2】可以按任务栏图标位置切换窗口。

#### (2)托盘右键菜单可以对映射的配置项进行预览。

#### (3)添加ReplaceText$方法可以替换选中文本，例如s=ReplaceText$({Pet})则按【CapsLock+S】给选中的文本添加小括号，参数中{Pet}为选中文本。

#### (4)添加SendInput$方法，例如p=SendInput${MButton}则按【CapsLock+P】模拟鼠标中键点击，参数和Space模式一样。

#### (5)添加PetLock方法，锁住键盘鼠标，例如Enter=PetLck则按【CapsLock+Enter】锁定键盘鼠标，不过不能阻止系统组合键，例如Ctrl+Alt+Delete和Win+L。

#### (6)添加GetProcessPath方法，获取活动窗口路径，双击热键定位，例如m=GetProcessPath则按【CapsLock+M】获取活动窗体路径。

#### (7)添加GetClassName方法，获取活动窗口类名，双击热键复制类名，例如n=GetClassName则按【CapsLock+N】获取活动窗体类名。

[图片预览1](https://meta.appinn.net/uploads/default/original/2X/8/8beb167a200ecf50e271e90b9336c807c25febca.png)

![图片预览1](https://meta.appinn.net/uploads/default/original/2X/8/8beb167a200ecf50e271e90b9336c807c25febca.png)

[图片预览2](https://meta.appinn.net/uploads/default/original/2X/3/34ec08e3efb7b2b3b257231ce63e1e41ba7c35f1.png)

![图片预览2](https://meta.appinn.net/uploads/default/original/2X/3/34ec08e3efb7b2b3b257231ce63e1e41ba7c35f1.png)

