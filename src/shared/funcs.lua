Trace = function(...)
    if not Config.DEBUG then
        return
    end

    local logLine = ""
    local logString = { ... }

    if IsDuplicityVersion() then
        logLine = os.date('%Y-%m-%d %H:%M:%S', os.time())
    end

    logLine = logLine .. " [" .. (GetCurrentResourceName() or "LOG") .. "] "

    for i = 1, #logString do
        logLine = logLine .. tostring(logString[i]) .. " "
    end

    print(logLine)
end

GetIdentifierFromString = function(source, name)
    local identifiers = GetPlayerIdentifiers(source)
    local res = {}

    for _, identifier in pairs(identifiers) do
        local id = identifier:match("(.+):")

        res[id] = identifier
    end

    return res[name]
end
