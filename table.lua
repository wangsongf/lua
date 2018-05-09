-----------------------------------------------
---Lua基础之table详解
---https://blog.csdn.net/dingkun520wy/article/details/50231603
-----------------------------------------------


--table的构造
t = {}          --定义一个空表  
t["jun"] = 6    --字符串key值的属性  
t[1] = 1        --数字key值的属性  
t.jun = 16      --字符串key值的简写  
t.test = {num=28,str="test"}    --属性可以是table  
print(t.test.num)               --输出28  
t.testFunction = function() print("函数") end  --属性可以是function  
t.testFunction()                --调用函数  
t:testFunction()                --同上  
  
--上面的table还可以这么写  
t=  
{  
    1,  
    jun = 6,  
    test=  
    {  
        num = 28,  
        str = "test",  
    },  
    testFunction = function() print("函数") end,  
} 




-- table.concat(table, sep,  start, end)
local tbl = {"apple", "pear", "orange", "grape"}  
   
print(table.concat(tbl))     
print(table.concat(tbl, "、"))    
print(table.concat(tbl, "、", 2))    
print(table.concat(tbl, "、", 2, 3)) 

--table.unpack(table, start, end)
local tbl = {"apple", "pear", "orange", "grape"}  
print(table.unpack(tbl))  
   
local a, b, c, d = table.unpack(tbl)  
print(a, b, c, d)  
   
print(table.unpack(tbl, 2))  
print(table.unpack(tbl, 2, 3))  


--table.maxn(table)
tbl = {[1] = "a", [2] = "b", [3] = "c", [26] = "z"}  
print(#tbl)           --3因为26和之前的数字不连续, 所以不算在数组部分内  
print(table.maxn(tbl))   --26  
tbl[91.32] = true  
print(table.maxn(tbl))  --91.32  

--table.getn(table)
t1 = {1, 2, 3, 5}
--print(getn(t1))     5.2以后已经没有了
local count = 0
for k,v in pairs(t1) do
    count = count + 1
end
print(count)

-- table.insert(table, pos, value)
local tbl = {"apple", "pear", "orange", "grape"}  
   
table.insert(tbl, "watermelon")  
print(table.concat(tbl, "、"))  
   
table.insert(tbl, 2, "watermelon")  
print(table.concat(tbl, "、"))  