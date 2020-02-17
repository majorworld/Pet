;#:Win键 !:Alt键 ^:Ctrl键 +:Shift键 &:将两个键组合成一个键列
;单例运行
#SingleInstance Force
;持续运行
#Persistent
;隐藏托盘
#NoTrayIcon
;鼠标悬浮托盘
Menu, Tray, Tip, Pet
;全局变量
global path = A_ScriptDir "\Pet\"
global help = A_ScriptDir "\Pet\Help.txt"
global habit = A_ScriptDir "\Pet\Pet.ini"
global note = A_ScriptDir "\Pet\Note.txt"
global power := 0
;创建文件夹
FileCreateDir, %path%
;读取配置文件文件
IniRead, Display, %habit%, Display, IconVisible
if(%Display% = true) {
    Menu, Tray, Icon
}
;检查是否首次运行
if Not FileExist(help) {
    Help()
}
;设置提示文字默认位置
CoordMode, ToolTip, Screen
;创建托盘图标菜单
Menu, tray, add, Help, Help
return
Help:
    Help()
return
;延时关闭提示文字方法
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
Return
;增强模式提示
PowerHint:
    if(power=0) {
        SetTimer, PowerHint, Off
        ToolTip
    } else {
        ToolTip, 增强模式Win+CapsLock切换
    }
Return

;增强模式开关
#CapsLock::
    if(power=1) {
        power:=0
        ToolTip
    } else {
        power:=1
    }
    SetTimer, PowerHint, 100
Return
;禁用
#Esc::
    Suspend
    power:=0
    if A_IsSuspended {
        ToolTip, 禁用功能
    } else {
        ToolTip, 启用功能
    }
    SetTimer, RemoveToolTip, 1000
Return
;退出
$Esc::
    if(power) {
        if(GetKeyState("Space", "P") = 1) {
            ExitApp, 100
        } else {
            power:=0
        }
    } else {
        SendInput, {Blind}{Esc}
    }
Return

;重启
$\::
    if(power) {
        Reload
    } else {
        SendInput, {Blind}{\}
    }
Return
$+\::
    if(power) {
        try {
            if A_IsCompiled
                Run *RunAs "%A_ScriptFullPath%" /restart
            else
                Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    } else {
        SendInput, {Blind}{\}
    }
Return
;隐藏托盘图标
$[::
    if(power) {
        if A_IconHidden {
            Menu, Tray, Icon
            IniWrite, true, %habit%, Display, IconVisible
            ToolTip, 显示托盘图标
        } else {
            Menu, Tray, NoIcon
            IniWrite, false, %habit%, Display, IconVisible
            ToolTip, 隐藏托盘图标
        }
        SetTimer, RemoveToolTip, 1000
    } else {
        SendInput, {Blind}{[}
    }
Return
;开机自启
$]::
    if(power) {
        RegRead, out, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Pet
        if (out = A_ScriptFullPath) {
            RegDelete, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Pet
            ToolTip, 取消开机自启
        } else {
            RegWrite REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Pet, %A_ScriptFullPath%
            ToolTip, 设置开机自启
        }
        SetTimer, RemoveToolTip, 1000
    } else {
        SendInput, {Blind}{]}
    }
Return

FastKey:
    Suspend On
    if(GetKeyState("'", "P") = 0) {
        Input
        SetTimer, FastKey, Off
        Suspend Off
    }
Return
;快捷命令
$'::
    SetTimer, FastKey, 100
    Input, UserInput
    KeyWait, '
    if(A_ThisHotkey = "$" "'" and A_TimeSinceThisHotkey < 300) {
        SendInput, {Blind}{'}
    } else {
        order := StrReplace(UserInput, "'", "")
        if(order="") {
        Return
    }
    try {
        Run %order%
    } catch {
        ToolTip, %order%
        SetTimer, RemoveToolTip, 1000
    }
}
Return

;空格监视
$Space::
    power:=1
    KeyWait, Space
    power:=0
    if(A_ThisHotkey = "$Space" and A_TimeSinceThisHotkey < 200) {
        SendInput, {Blind}{Space}
    }
Return

;光标移动
$E::
    if(power) {
        SendInput, {Blind}{UP}
    } else {
        SendInput, {Blind}{e}
    }
Return
$+E::
    if (power) {
        SendInput, +{UP}
    } else {
        SendInput, {Blind}{e}
    }
Return
$^E::
    if (power) {
        SendInput, ^{Up}
    } else {
        SendInput, {Blind}{e}
    }
Return
$D::
    if(power) {
        SendInput, {Down}
    } else {
        SendInput, {Blind}{d}
    }
Return
$+D::
    if (power) {
        SendInput, +{Down}
    } else {
        SendInput, {Blind}{d}
    }
Return
$^D::
    if (power) {
        SendInput, ^{Down}
    } else {
        SendInput, {Blind}{d}
    }
Return
$S::
    if(power) {
        SendInput, {Left}
    } else {
        SendInput, {Blind}{s}
    }
Return
$+S::
    if (power) {
        SendInput, +{Left}
    } else {
        SendInput, {Blind}{s}
    }
Return
$^S::
    if (power) {
        SendInput, ^{Left}
    } else {
        SendInput, {Blind}{s}
    }
Return
$F::
    if(power) {
        SendInput, {Right}
    } else {
        SendInput, {Blind}{f}
    }
Return
$+F::
    if (power) {
        SendInput, +{Right}
    } else {
        SendInput, {Blind}{f}
    }
Return
$^F::
    if (power) {
        SendInput, ^{Right}
    } else {
        SendInput, {Blind}{f}
    }
Return
;行首
$W::
    if (power) {
        SendInput {Home}
    } else {
        SendInput, {Blind}{w}
    }
Return
$+W::
    if (power) {
        SendInput +{Home}
    } else {
        SendInput, {Blind}{w}
    }
Return
$^W::
    if (power) {
        SendInput ^{Home}
    } else {
        SendInput, {Blind}{w}
    }
Return
;行尾
$R::
    if (power) {
        SendInput {End}
    } else {
        SendInput, {Blind}{r}
    }
Return
$+R::
    if (power) {
        SendInput +{End}
    } else {
        SendInput, {Blind}{r}
    }
Return
$^R::
    if (power) {
        SendInput ^{End}
    } else {
        SendInput, {Blind}{r}
    }
Return

;页面操作
$A::
    if (power) {
        SendInput {Enter}
    } else {
        SendInput, {Blind}{a}
    }
Return
$G::
    if (power) {
        SendInput {AppsKey}
    } else {
        SendInput, {Blind}{g}
    }
Return
$CapsLock::
    if (power) {
        SendInput {Esc}
    } else {
        SendInput, {Blind}{CapsLock}
    }
Return
;退格
$Q::
    if (power) {
        SendInput {BackSpace}
    } else {
        SendInput, {Blind}{q}
    }
Return
$Z::
    if (power) {
        SendInput ^z
    } else {
        SendInput, {Blind}{z}
    }
Return
$X::
    if (power) {
        SendInput ^x
    } else {
        SendInput, {Blind}{x}
    }
Return
$C::
    if (power) {
        SendInput ^c
    } else {
        SendInput, {Blind}{c}
    }
Return
$V::
    if (power) {
        SendInput ^v
    } else {
        SendInput, {Blind}{v}
    }
Return
$Y::
    if (power) {
        SendInput ^y
    } else {
        SendInput, {Blind}{y}
    }
Return

;多媒体
$Up::
    if(power) {
        SendInput, {Volume_Up}
    } else {
        SendInput, {Blind}{Up}
    }
Return
$Down::
    if(power) {
        SendInput, {Volume_Down}
    } else {
        SendInput, {Blind}{Down}
    }
Return
$End::
    if(power) {
        SendInput, {Volume_Mute}
    } else {
        SendInput, {Blind}{End}
    }
Return
$Home::
    if(power) {
        SendInput, {Media_Play_Pause}
    } else {
        SendInput, {Blind}{Home}
    }
Return
$Left::
    if(power) {
        SendInput, {Media_Prev}
    } else {
        SendInput, {Blind}{Left}
    }
Return
$Right::
    if(power) {
        SendInput, {Media_Next}
    } else {
        SendInput, {Blind}{Right}
    }
Return

;取色器
$B::
    if (power) {
        MouseGetPos x, y
        PixelGetColor rgb, x, y, RGB
        stringreplace, out, rgb, 0x, , All
        ToolTip %out%
        if(A_PriorHotkey = "$B" and A_TimeSincePriorHotkey < 400) {
            Clipboard = %out%
            ToolTip %out% 已复制
        }
        SetTimer, RemoveToolTip, 1000
    } else {
        SendInput, {Blind}{b}
    }
Return

;鼠标向上
MouseUp()
{
    if(power) {
        if(GetKeyState("J", "P") = 1) {
            MouseMove, -Speed(), -Speed(), 0, R
        } else if (GetKeyState("L", "P") = 1) {
            MouseMove, Speed(), -Speed(), 0, R
        } else {
            MouseMove, 0, -Speed(), 0, R
        }
    } else {
        SendInput, {Blind}{i}
    }
}
$I::
    MouseUp()
Return
$^I::
    MouseUp()
Return
$+I::
    MouseUp()
Return
;鼠标向下
MouseDown()
{
    if(power) {
        if(GetKeyState("J", "P") = 1) {
            MouseMove, -Speed(), Speed(), 0, R
        } else if (GetKeyState("L", "P") = 1) {
            MouseMove, Speed(), Speed(), 0, R
        } else {
            MouseMove, 0, Speed(), 0, R
        }
    } else {
        SendInput, {Blind}{k}
    }
}
$K::
    MouseDown()
Return
$+K::
    MouseDown()
Return
$^K::
    MouseDown()
Return
;鼠标向左
MouseLeft()
{
    if(power) {
        if(GetKeyState("I", "P") = 1) {
            MouseMove, -Speed(), -Speed(), 0, R
        } else if (GetKeyState("K", "P") = 1) {
            MouseMove, -Speed(), Speed(), 0, R
        } else {
            MouseMove, -Speed(), 0, 0, R
        }
    } else {
        SendInput, {Blind}{j}
    }
}
$J::
    MouseLeft()
Return
$+J::
    MouseLeft()
Return
$^J::
    MouseLeft()
Return
;鼠标向右
MouseRight()
{
    if(power) {
        if(GetKeyState("I", "P") = 1) {
            MouseMove, Speed(), -Speed(), 0, R
        } else if (GetKeyState("K", "P") = 1) {
            MouseMove, Speed(), Speed(), 0, R
        } else {
            MouseMove, Speed(), 0, 0, R
        }
    } else {
        SendInput, {Blind}{l}
    }
}
$L::
    MouseRight()
Return
$+L::
    MouseRight()
Return
$^L::
    MouseRight()
Return
;滚轮向上
$U::
    if(power) {
        MouseClick, WheelUp
    } else {
        SendInput, {Blind}{u}
    }
Return
;向上翻页
$^U::
    if(power) {
        SendInput, {PgUp}
    } else {
        SendInput, {Blind}{u}
    }
Return
;滚轮向下
$O::
    if(power) {
        MouseClick, WheelDown
    } else {
        SendInput {Blind}{o}
    }
Return
;向下翻页
$^O::
    if(power) {
        SendInput, {PgDn}
    } else {
        SendInput, {Blind}{o}
    }
Return
;鼠标左键
$`;::
    if(power) {
        MouseClick, Left, , , , , D
        KeyWait, `;
        MouseClick, Left, , , , , U
    } else {
        SendInput, {Blind}{`;}
    }
Return
;鼠标右键
$H::
    if(power) {
        MouseClick, Right, , , , , D
        KeyWait, H
        MouseClick, Right, , , , , U
    } else {
        SendInput, {Blind}{h}
    }
Return
;速度方法
Speed()
{
    if (GetKeyState("Ctrl", "P") = 1) {
        Return 200
    } else {
        if (GetKeyState("Shift", "P") = 1) {
            Return 10
        }
    }
    Return 23
}

;上个窗口
$N::
    if(power) {
        SendInput !+{Esc}
    } else {
        SendInput, {Blind}{n}
    }
Return
;下个窗口
$M::
    if(power) {
        SendInput !{Esc}
    } else {
        SendInput, {Blind}{m}
    }
Return
;上个桌面(逗号)
$sc033::
    if(power) {
        SendInput ^#{Left}
    } else {
        SendInput, {Blind}{, }
    }
Return
;下个桌面
$.::
    if(power) {
        SendInput ^#{Right}
    } else {
        SendInput, {Blind}{.}
    }
Return
;任务视图
$/::
    if(power) {
        SendInput, !^{Tab}
    } else {
        SendInput, {Blind}{/}
    }
Return
$+/::
    if(power) {
        SendInput, !^+{Tab}
    } else {
        SendInput, {Blind}{/}
    }
Return
;窗口
$T::
    if(power) {
        WinGet, ExStyle, ExStyle, A
        ; 0x8 is WS_EX_TOPMOST.
        if (ExStyle & 0x8) {
            WinSet AlwaysOnTop, Off, A
            ToolTip, 取消置顶
        } else {
            WinSet AlwaysOnTop, On, A
            ToolTip, 设置置顶
        }
        SetTimer, RemoveToolTip, 1000
    } else {
        SendInput, {Blind}{t}
    }
Return

;笔记
$P::
    if(power) {
        if WinExist("Note.txt") or WinExist("*Note.txt") {
            WinActivate, Note.txt
            WinActivate *Note.txt
        } else {
            FileAppend, , %note%
            Run, %note%
        }
    } else {
        SendInput, {Blind}{p}
    }
Return

;显示帮助
$*Tab::
    if(power) {
        if WinExist("Help.txt") or WinExist("*Help.txt") {
            WinActivate, Help.txt
            WinActivate *Help.txt
        } else {
            Help()
        }
    } else {
        SendInput, {Blind}{Tab}
    }
Return

;数字模式
Tab & M::
    SendInput, {1}
Return
Tab & sc033::
    SendInput, {2}
Return
Tab & .::
    SendInput, {3}
Return
Tab & J::
    SendInput, {4}
Return
Tab & K::
    SendInput, {5}
Return
Tab & L::
    SendInput, {6}
Return
Tab & U::
    SendInput, {7}
Return
Tab & I::
    SendInput, {8}
Return
Tab & O::
    SendInput, {9}
Return
Tab & N::
    SendInput, {0}
Return
Tab & H::
    SendInput, {+}
Return
Tab & Y::
    SendInput, {-}
Return
Tab & P::
    SendInput, {=}
Return
Tab & `;::
    SendInput, {*}
Return
Tab & /::
    SendInput, {Text}/
Return

;帮助文件
Help()
{
    FileDelete, %help%
    FileAppend, 
    (
    Pet操作说明(都是基于长按空格后的操作)
    
    基础
    Esc=退出
    \=重启 Shift+\管理员身份重启
    Tab=帮助
    [=显示或隐藏托盘图标
    ]=设置或取消开机自启
    
    光标移动
    E=向上 Shift+E=向上多选 Ctrl+E=上一段
    D=向下 Shift+D=向下多选 Ctrl+D=下一段
    S=向左 Shift+S=向左多选 Ctrl+S=上一词
    F=向右 Shift+F=向右多选 Ctrl+F=下一词
    W=行首 Shift+W=选到行首 Ctrl+W=页首
    R=行尾 Shift+R=选到行尾 Ctrl+R=页尾
    
    页面操作
    A=回车
    G=菜单
    CapsLock=取消
    Q=退格
    Z=撤销
    X=剪切
    C=复制
    V=粘贴
    Y=重做
    
    多媒体
    Up=调高音量
    Down=调低音量
    Left=播放上一首
    Right=播放下一首
    Home=暂停或继续播放
    End=静音
    
    取色器
    B=显示鼠标区域色值 快速双击B=复制鼠标区域色值
    
    笔记
    P=快速打开本地笔记
    
    鼠标操作
    I=向上 Ctrl+I=高速 Shift+I=低速
    K=向下 Ctrl+K=高速 Shift+K=低速
    J=向左 Ctrl+J=高速 Shift+J=低速
    L=向右 Ctrl+L=高速 Shift+L=低速
    U=滚轮向上 Ctrl+U=向上翻页
    O=滚轮向上 Ctrl+O=向下翻页
    ;=鼠标左键
    H=鼠标右键
    
    窗口
    N=上个窗口
    M=下个窗口
    , =上个桌面(需要系统支持并且新建了桌面)
    .=下个桌面(需要系统支持并且新建了桌面)
    /=任务视图 Shfit+/=逆向切换(需要系统支持)
    T=置顶或取消置顶当前活动窗口
    
    特殊(不需要长按空格触发)
    Win+CapsLock=启用或禁用增强模式(该模式不长按空格直接触发)
    Win+Esc=禁用或启用所有功能
    
    数字模式
    按住Tab键右手就可以按数字键盘的布局输入数字
    M=1, =2 .=3
    J=4 K=5 L=6
    U=7 I=8 O=9
    N=0 H=+ Y=-
    P== ;=* /=/
    
    命令模式
    按住'键后输入命令松开'键便可以运行命令
    '键一般位于回车键左边一位
    运行失败后会显示输入内容
    例如按住'键后输入cmd打开命令提示符
    
    注意
    活动窗体属于管理员身份运行时热键暂时失效
    比如活动窗体是任务管理器时就无法响应热键
    办法是将本工具以管理员身份运行提升至相同的权限
    设置开机自启目前都是非管理员身份运行
    
    作者
    majorworld@outlook.com
    反馈
    https://github.com/majorworld/Pet/issues/
    时间
    2020-02-01
    ), %help%
    Run %help%
}
