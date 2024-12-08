local HttpService = game:GetService("HttpService")

local payload = {
    username = _G.username,
    avatar_url = (_G.avatar_url ~= "" and _G.avatar_url) or nil,
    content = _G.message,
    embeds = {}
}

if _G.title ~= "" or _G.description ~= "" or _G.Image ~= "" then
    table.insert(payload.embeds, {
        title = _G.title ~= "" and _G.title or nil,
        description = _G.description ~= "" and _G.description or nil,
        image = (_G.Image ~= "" and {url = _G.Image}) or nil
    })
end

local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request)
local response = httpRequest({
    Url = _G.webhookURL,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(payload)
})

if response and response.Success then
    print("Webhook sent successfully!")
else
    warn("Failed to send webhook.")
    if response then
        print("Status Code :", response.StatusCode)
        print("Response :", response.Body)
    else
        print("Response is nil.")
    end
end
