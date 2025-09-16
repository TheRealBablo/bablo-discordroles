Config = {}

Config.DEBUG = false -- Enable debug mode

Config.DiscordBot = {
    Token = "YOUR_DISCORD_BOT_TOKEN",   -- Your Discord bot token
    GuildID = "YOUR_DISCORD_SERVER_ID", -- Your Discord server ID
}

-- Roles you want to check against (use role names as keys for clarity)
Config.Roles = {
    ["EXAMPLE"] = "DISCORD_ROLE_ID_EXAMPLE", -- Example role
    -- ["VIP"] = "DISCORD_ROLE_ID_VIP", -- VIP role example
}
