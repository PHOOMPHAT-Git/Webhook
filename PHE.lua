local HttpService = game:GetService("HttpService")

local payload = {
    username = "By Phe",
    avatar_url = _G.avatar_url,
    content = _G.message,
}

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
