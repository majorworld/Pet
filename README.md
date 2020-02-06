;Pet版本号2.0
;最近维护时间2020-02-05
;反馈https://github.com/majorworld/Pet/issues/
;作者majorworld@outlook.com

;用分号来进行注释，且注释必须单独为一行
;#为Win键 !为Alt键 ^为Ctrl键 +为Shift键这四个修饰键比较特殊
;其他的就是{Enter}为回车，+{Home}就是向前选中文本，以此类推
;修改配置文件并保存后按CapsLock+R就能重启并立即生效





;----------------------------命令模式----------------------------
;按住'键后输入命令松开'键便可以运行命令
;'键一般位于回车键左边一位
;运行失败后会显示输入内容
;例如按住'键后输入cmd打开命令提示符






;----------------------------Space热键模式配置----------------------------
[Space]
;{Enter}为回车键
a={Enter}
;!{Esc}为跳转到下个窗口
b=!{Esc}
;^c为复制，^代表Ctrl，不要写成{Ctrl}了
c=^c
;按住Shift键就可以选择文字了，和普通方向键一样的操作，也可以设置为d=+{Down}，直接选择文字
d={Down}
e={Up}
f={Right}
;{AppsKey}为菜单键
g={AppsKey}
;添加{Text}前缀可以使文字不和输入法冲突
h={Text}+
i=8
j=4
k=5
l=6
m=1
n=0
o=9
p={=}
q={Backspace}
r={End}
s={Left}
;!+{Esc}为跳转到上一个窗口
t=!+{Esc}
u=7
;^v为粘贴
v=^v
w={Home}
;^x为剪切
x=^x
y=-
;^z为剪切
z=^z
;_fyh为反引号，一般位于Tab键上面一位
;!^{Tab}为打开任务视图，需要系统支持
_fyh=!^{Tab}
;{CapsLock}为切换大小写，原本的CapsLock键防止误按已被禁用
Tab={CapsLock}
;加{Text}前缀，输出的字符串不会受输入法干扰
1={Text}one
2={Text}two
3={Text}three
4={Text}four
5={Text}five
6={Text}six
7={Text}seven
8={Text}eight
9={Text}nine
0={Text}zero
-=
;这里可以替换为自己的邮箱，方便日常快速输入，也可以换成其他热键
;_dyh为等于号
_dyh={Text}majorworld@outlook.com
,=2
.=3
;{Text}/为除号，这里如果不加{Text}前缀，在中文输入法会输出、(顿号)
/={Text}/
_;={Text}*
;_yh为引号，一般位于回车键左边
_yh={Delete}
;^#{Left}为跳转到上个桌面，需要系统支持
_[=^#{Left}
;^#{Right}为跳转到下个桌面，需要系统支持
_]=^#{Right}
;+{End}{Backspace}是一种组合按键，在当前行选中光标右边的内容并删除，用户可以发挥想象自己进行按键组合，来获取最大的效率
\=+{End}{Backspace}
;{End}{Enter}为不影响当前行进行回车
Enter={End}{Enter}
;+{Home}{Backspace}是一种组合按键，在当前行选中光标做边的内容并删除，用户可以发挥想象自己进行按键组合，来获取最大的效率
Backspace=+{Home}{Backspace}
Delete=
Insert=
;{Media_Play_Pause}多媒体按键，暂停或继续播放
Home={Media_Play_Pause}
;{Volume_Mute}多媒体按键，静音或取消静音
End={Volume_Mute}
PgUp=
PgDn=
;{Volume_Up}为多媒体按键，调高音量
Up={Volume_Up}
;{Volume_Down}为多媒体按键，调低音量
Down={Volume_Down}
;{Media_Prev}为多媒体按键，播放上一首
Left={Media_Prev}
;{Media_Next}为多媒体按键，播放下一首
Right={Media_Next}
;这里可以替换为自己常用的句子
F1={Text}富强
F2={Text}民主
F3={Text}文明
F4={Text}和谐
F5={Text}自由
F6={Text}平等
F7={Text}公正
F8={Text}法治
F9={Text}爱国
F10={Text}敬业
F11={Text}诚信
F12={Text}友善






;----------------------------CapsLock方法模式配置----------------------------
[CapsLock]
;这里是CapsLock方法模式，这里的方法不能放到Space热键模式
;$后面代表参数，只接受一个参数，大部分方法不需要参数
;参数里的{Pet}会被替换为剪切板内容
;需要新的方法可以邮箱联系

;ExitPet是退出方法，需要的参数是退出时返回给它的调用者，一般用户不需要更改该参数
a=ExitPet$100
b=
;GetColor是取色器方法，双击热键复制颜色
c=GetColor
;Run是调用系统运行方法，需要一个命令参数
d=Run$https://www.baidu.com/s?wd={Pet}
;这里的功能是快速调用Everything软件查询选中的内容，{Pet}字符串会替换为剪切板的内容，其他软件可以类似调用
e=CopyRun$C:\Program Files\Everything\Everything.exe -s {Pet}
;CopyRun方法调用了Run方法，在调用前模拟复制快捷键，简化了操作
f=CopyRun$https://fanyi.baidu.com/#zh/en/{Pet}
g=
;RightClick鼠标右键，长按模拟鼠标长按
h=RightClick
;控制鼠标的四个方法，需要一个移动速度参数，也可以让不同的热键有不同的鼠标移动速度
i=MouseUp$23
j=MouseLeft$23
k=MouseDown$23
l=MouseRight$23
m=
n=
;WheelDown为鼠标滚轮向下
o=WheelDown
p=
q=
;ReloadPet为重启方法
r=ReloadPet
s=
;TopMost为置顶或取消置顶活动窗口
t=TopMost	
;WheelUp为鼠标滚轮向上
u=WheelUp
;Position为打开所在位置方法
v=Position
w=
;Profile为打开配置文件方法
x=Profile
y=
;Reward为扫码打赏
z=Reward
;_fyh为反引号，一般位于Tab键的上面
_fyh=
;SetCapsLock为切换大小写方法，原本的CapsLock键防止误按已被禁用
Tab=SetCapsLock
1=
2=
3=
4=
5=
6=
7=
8=
9=
0=
-=
;_dyh为等于号
_dyh=
,=
.=
/=
;LeftClick为鼠标左键，长按模拟鼠标长按
_;=LeftClick
_yh=
;HideTray为控制托盘图标显示方法
_[=HideTray
;StartUp为设置或取消开机启动方法
_]=StartUp
\=
Enter=
Backspace=
Delete=
Insert=
Home=
End=
PgUp=
PgDn=
Up=
Down=
Left=
Right=
;SetTransparent为设置窗体透明度，参数1为增强透明度2为减弱透明度，并不是所有的窗口都支持设置透明度
F1=SetTransparent$1
F2=SetTransparent$0
;MouseClicks为鼠标点击器，参数为时间间隔，单位毫秒，再按则停止
F3=MouseClicks$500
F4=
F5=
F6=
F7=
F8=
F9=
F10=
F11=
F12=






;----------------------------配置----------------------------
;控制托盘图标显示与否
[Pet]
;是否显示托盘图标
TrayVisible=1
;是否每次启动显示欢迎界面
Welcome=1
;是否是首次启动
Stranger=1
;是否开机自启
StartUp=0
