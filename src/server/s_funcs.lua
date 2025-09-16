Main = {
    loaded = false,
    playerRoles = {}
}

function Main:Handle(source)
    local discordId = GetIdentifierFromString(source, 'discord');

    if not discordId then
        Trace("No Discord ID found for player")
        return
    end

    discordId = discordId:gsub("discord:", "")

    local p = promise.new();

    PerformHttpRequest("https://discord.com/api/v8/guilds/" .. Config.DiscordBot.GuildID .. "/members/" .. discordId,
        function(code, data, headers)
            if tonumber(code) == 200 then
                data = json.decode(data)

                p:resolve(data.roles)
            else
                p:resolve(false)
            end
        end, "GET", "", {
            ['Content-Type'] = 'application/json',
            ["Authorization"] = "Bot " .. Config.DiscordBot.Token
        })

    local result = Citizen.Await(p);

    if not result then
        return
    end

    Main.playerRoles[discordId] = {}
    for roleName, roleId in pairs(Config.Roles) do
        for _, userRole in pairs(result) do
            if userRole == roleId then
                Main.playerRoles[discordId][roleName] = true
            end
        end
    end

    local player = Player(source)
    if player then
        player.state:set('DISCORD_ROLES', Main.playerRoles[discordId], true)

        Trace("Set roles for player " .. source)
        Trace(json.encode(Main.playerRoles[discordId], { indent = true }))
    else
        Trace("Player not found for source " .. source)
    end
end
