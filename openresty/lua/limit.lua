ngx.header.content_type = "text/html; charset=utf-8";
local method=ngx.req.get_method()
local curl=ngx.md5(ngx.var.request_uri);
local request_uri_without_args = ngx.re.sub(ngx.var.request_uri, "\\?.*", "");
ngx.say(request_uri_without_args)
local match = string.match
local ngxmatch=ngx.re.match
ngx.say("hello world")
--ngx.exit(200);
--限流计数
function limit_url_check(key,s,m)
    
    local localkey=key;
    local yyy_limit=ngx.shared.url_limit
    --ngx.say(ngx.time())
    --ngx.exit(200)
    --每分钟限制
    local key_m_limit=  localkey..os.date("%Y-%m-%d %H:%M", ngx.time()) 
    --每秒限制
    local key_s_limit=  localkey..os.date("%Y-%m-%d %H:%M:%S", ngx.time())
    local req_key,_=yyy_limit:get(localkey);
    local req_key_s,_=yyy_limit:get(key_s_limit);
    local req_key_m,_=yyy_limit:get(key_m_limit);
    ngx.say(req_key_s)
    ngx.say(req_key_m)
    --ngx.say(key_s_limit)
    --ngx.exit(200)
    --每秒处理
    if req_key_s then
        yyy_limit:incr(key_s_limit,1)
        if req_key_s>s then 
            return true 
            --return false
        end
    else
        yyy_limit:set(key_s_limit,1,60)
    end
    --每分钟处理
    if req_key_m then
        yyy_limit:incr(key_m_limit,1)
        if req_key_m>m then 
            return true
            --return false
        end
    else
        yyy_limit:set(key_m_limit,1,85)
    end

    return false
end

if   ngx.re.match(request_uri_without_args,"/limit") --/cart/inf(.*)
    then
    if limit_url_check("appcartinfo",2,10) then
        ngx.say('{"code": 524,"msg": "啊啊啊，每逢大促，排队结账。当前访问的用户过多，请稍后再试！","alert": "啊啊啊，每逢大促，排队结账。当前访问的用户过多，请稍后再试！"}')
        ngx.exit(200);
        return
    end
end