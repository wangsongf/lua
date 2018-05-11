---------------------------------------------------- 
-- 3.1 元表（metatable） 和元方法（metamethod）。 
---------------------------------------------------- 

-- table的元表提供了一种机制，可以重定义table的一些操作。 
-- 之后我们会看到元表是如何支持类似js的prototype行为。

f1 = {a = 1, b = 2}  -- 表示一个分数 a/b. 
f2 = {a = 2, b = 3} 

-- 这个是错误的： 
-- s = f1 + f2 

metafraction = {} 
function metafraction.__add(f1, f2) 
  sum = {} 
  sum.b = f1.b * f2.b 
  sum.a = f1.a * f2.b + f2.a * f1.b 
  return sum 
end 

setmetatable(f1, metafraction) 
setmetatable(f2, metafraction) 

s = f1 + f2  -- 调用在f1的元表上的__add(f1, f2) 方法 
print(f1.b)
print(f2.b)
print(s.b)
print(s.a)
-- 元表的__index 可以重载点运算符的查找： 
defaultFavs = {animal = 'gru', food = 'donuts'} 
myFavs = {food = 'pizza'} 
setmetatable(myFavs, {__index = defaultFavs}) 
eatenBy = myFavs.animal  -- 可以工作！这要感谢元表的支持 



mytable = setmetatable({ 10, 20, 30 }, {
  __tostring = function(mytable)
    sum = 0
    for k, v in pairs(mytable) do
        sum = sum + v
    end
    return "表所有元素的和为 " .. sum
  end
})
print(mytable)


-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- 定义元方法__call
mytable = setmetatable({10}, {
  __call = function(mytable, newtable)
    sum = 0
    for i = 1, table_maxn(mytable) do
        sum = sum + mytable[i]
    end
    for i = 1, table_maxn(newtable) do
        sum = sum + newtable[i]
    end
    return sum
  end
})
newtable = {10,20,30}
print(mytable(newtable))