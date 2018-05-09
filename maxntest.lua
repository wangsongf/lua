-- 各种索引都存在
local tabLanguage = { 
    up ="Lua",
    "c",
    "c++",
    [100] = "end",
    realend = "realend",
    [-1] = "haha";
};

for k,v in pairs(tabLanguage) do
    print(k,v)
end
print("LUA>>>>>>the maxn of table tabLanguage :", table.maxn(tabLanguage), "\n")

-- 使用默认数字索引
local tabTest1 = { 
    "c",
    "c++",
    "php"
};

for k,v in pairs(tabTest1) do
    print(k,v)
end
print("LUA>>>>>>the maxn of table tabTest1 :", table.maxn(tabTest1), "\n")

-- 负数索引
local tabTest2 = { 
    [-1] = "c",
    [-100] = "c++",
    [-10] = "php",
};

for k,v in pairs(tabTest2) do
    print(k,v)
end
print("LUA>>>>>>the maxn of table tabTest2 :", table.maxn(tabTest2), "\n")

-- 非数字索引
local tabTest3 = { 
    first = "c",
    second = "c++",
    third = "php"
};

for k,v in pairs(tabTest3) do
    print(k,v)
end
print("LUA>>>>>>the maxn of table tabTest :", table.maxn(tabTest3), "\n")