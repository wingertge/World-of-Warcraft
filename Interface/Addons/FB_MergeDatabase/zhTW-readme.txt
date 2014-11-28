- This readme was edited within ANSI . in case that Taiwaness players open this with Microsoft notepad.
- 因為怕翻譯與作者原意有所失真,故附上英文原文                      edited by indra

This mod saves a copy of your fishing data (or the delta of your fishing data as you fish) in such a way that you can merge it with another copy.
本模組主要是儲存一份複製資料(或釣魚時的增量資料)，讓你能整合到另外一份紀錄

1. Log out of WoW
2. Squirrel away the 'target' copy of FB_MergeDatabase.lua
3. Copy FB_MergeDatabase.lua to the 'target' machine
4. Put the 'source' FB_MergeDatabase.lua in the 'target' SavedVariables folder
5. Log into WoW

******* 以實例說明比「來源目標」的說法容易理解，以下都假設『要把A電腦的資料複製到B電腦』*******

一.B電腦 登出 WOW
二.把你想要匯入資料那台「B電腦」的 FB_MergeDatabase.lua 先備份儲存到別的地方以防萬一
三.把想要匯入的「A電腦」的 FB_MergeDatabase.lua 複製到那台電腦
四.把想要匯入的「A電腦」的 FB_MergeDatabase.lua 放進『 /WTF/帳號/SavedVariables  』 資料夾
五.B電腦 登入 WOW

All of the 'source' fish are now merged with the 'target' database. Do the reverse with the 'target' FB_MergeDatabase and both machines are now 'in sync.'
現在，A電腦的資料已經整合到B電腦了。現在把AB電腦裡面的FB_MergeDatabase 反過來做一次
那麼兩台電腦的釣魚資料就同步了。

Here's how to merge two FishingBuddy.lua files.
以下是整合兩份FishingBuddy.lua 的方法.

1. Log into Wow, run '/fb merge force'
2. Copy the other FishingBuddy.lua file into SavedVariables (overwrites the original -- back it up first)
3. Log into Wow

一.B電腦登入 WOW ，執行 /fb merge force   (注：這將強制製作出一份FB_MergeDatabase.lua的資料，而且這邊執行後應該要登出)
二.將A電腦的FishingBuddy.lua複製到這台B電腦的『 /WTF/帳號/SavedVariables  』 資料夾(將覆蓋掉原來的--請先備份)
三.B電腦登入 WOW

(注：如果你第一個步驟執行完不想登出，那麼第三個步驟可以用 /console reloadui 指令代替)

You should get a not-very-useful-yet message in the Chat window that your fish have been merged.
然後你應該會看到訊息視窗出現一個不是很有用的訊息通知你漁獲資料已經整合了

Going between machines, the FB_MergeDatabase.lua file from the 'other' machine(s) goes into SavedVariables and 
then you log into WoW and the fish will be merged -- the FB_MergeDatabase structures are emptied out, ready to start capturing new fishing.
同樣的AB電腦角色對調，FB_MergeDatabase.lua 放進另一台電腦的『 /WTF/帳號/SavedVariables  』
等你登入另一台電腦的時候，兩份漁獲資料將被整合。
原本FB_MergeDatabase 裡面的資料會被清空。準備繼續釣魚吧!!!

