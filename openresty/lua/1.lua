-- 判断是否是手机浏览器
function isMobile(userAgent)
    -- 99% 前三个都能匹配上吧
    local mobile = {
        "phone", "android", "mobile", "itouch", "ipod", "symbian", "htc", "palmos", "blackberry", "opera mini", "windows ce", "nokia", "fennec",
        "hiptop", "kindle", "mot", "webos", "samsung", "sonyericsson", "wap", "avantgo", "eudoraweb", "minimo", "netfront", "teleca"
    }
    userAgent = string.lower(userAgent)

    for i, v in ipairs(mobile) do
        if string.match(userAgent, v) then
            return true
        end
    end

    return false
end

-- 根据id + 浏览器类型展示活动页面
function showPromotionHtml(id, isMobile)
    local path = "/var/www/demo/"
    local filename

    if isMobile then
        path = path .. "mobile"
    else
        path = path .. "pc"
    end

    filename = path .. "/" .. id .. ".html"

    if file_exists(filename) then
        local file = io.open(filename,"r")
        io.input(file)
        ngx.say(io.read("*a"))
        io.close(file)
    else
        ngx.say("file not found : " .. string.gsub(filename, "/data/www/mengkang/demo", ""))
    end
end

-- 判断文件是否存在
function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

local id = ngx.var.id
local userAgent = ngx.req.get_headers().user_agent
showPromotionHtml(id, isMobile(userAgent))
