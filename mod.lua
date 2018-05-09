---------------------------------------------------- 
-- 4. 模块 
---------------------------------------------------- 


-- 我把这部分给注释了，这样脚本剩下的部分就可以运行了 

-- 假设文件mod.lua的内容是： 
local M = {} 

local function sayMyName() 
  print('Hrunkner') 
end 

function M.sayHello() 
  print('Why hello there') 
  sayMyName() 
end 

return M 

-- 另一个文件也可以使用mod.lua的函数： 
local mod = require('mod')  
-- 运行文件mod.lua. 

-- require是包含模块的标准做法。 
-- require等价于:     (针对没有被缓存的情况；参加后面的内容) 
local mod = (function () 
  <contents of mod.lua> 
end)() 
-- mod.lua就好像一个函数体，所以mod.lua的局部变量对外是不可见的。 

-- 下面的代码是工作的，因为在mod.lua中mod = M： 
mod.sayHello()  -- Says hello to Hrunkner. 

-- 这是错误的；sayMyName只在mod.lua中存在： 
mod.sayMyName()  -- 错误 

-- require返回的值会被缓存，所以一个文件只会被运行一次， 
-- 即使它被require了多次。 

-- 假设mod2.lua包含代码"print('Hi!')"。 
local a = require('mod2')  -- 打印Hi! 
local b = require('mod2')  -- 不再打印; a=b. 

-- dofile与require类似，只是不做缓存： 
dofile('mod2')  --> Hi! 
dofile('mod2')  --> Hi! (再次运行，与require不同) 

-- loadfile加载一个lua文件，但是并不允许它。 
f = loadfile('mod2')  -- Calling f() runs mod2.lua. 

-- loadstring是loadfile的字符串版本。 
g = loadstring('print(343)')  --返回一个函数。 
g()  -- 打印343; 在此之前什么也不打印。 


---------------------------------------------------- 
-- 5. 参考文献 
---------------------------------------------------- 

--[[ 


   我非常兴奋的学习lua，主要是为了使用Löve 2D游戏引擎来编游戏。这就是动机。

    我在黑色子弹四开始中lua编程生涯的。

    接着，我阅读了Lua官方编程手册。就是现在阶段。  

    在lua-users.org的文章大概非常值得看看。他的主题没有覆盖的是标准库：

 * string library 
 * table library 
 * math library 
 * io library 
 * os library 

  另外，这个文件是一个合法Lua；把它保存为learn.lua,并且用“lua learn.lua”运行。

  初次在tylerneylon.com写文章，这也可以作为一个github gist脚本。用Lua愉快的编程把！


--]] 