--
--
-- 拿客 
-- 网站：www.coderknock.com 
-- QQ群：213732117
-- 三产 创建于 2017年06月15日 12:04:54。
-- 描述：
--
--
local strings website = "coderknock.com"
print(website)
local tables testArray = { website, "sanchan", true, 2, 3.1415926 }

-- 遍历 testArray
print("========  testArray =======")
for i = 1, #testArray
do
    print(testArray[i])
end
-- 另一种遍历方式
print("======== in  testArray =======")
for index, value in ipairs(testArray)
do
    -- 这种方式拼接 boolean 是会报错
    print("index ---->"..index)
    -- 这种组合大量数据时效率高
    print(value)
end

--while 循环
print("======== while =======")
local int sum = 0
local int i = 0
while i <= 100
do
    sum = sum +i
    i = i + 1
end
--输出结果为5050
print(sum)

--if else
print("======== if else =======")
for i = 1, #testArray
do
    if testArray[i] == "sanchan"
    then
        print("true")
        break
    else
        print(testArray[i])
    end
end

-- 哈希
local tables user_1 = { age = 28, name = "tome" }
--user_1 age is 28
print("======== hash =======")
print(user_1["name"].." age is " .. user_1["age"])
print("======== in hash =======")
for key, value in pairs(user_1)
do
    print(key .. ":".. value)
end

print("======== function =======")
function funcName(str)
    -- 代码逻辑
    print(str)
    return "new"..str
end

print(funcName("123"))