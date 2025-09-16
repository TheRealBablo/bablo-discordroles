# bablo-discordroles

A FiveM resource for synchronizing Discord roles to player statebags, allowing you to easily check Discord permissions client-side and integrate with other scripts (like bablo-animations) for role-based features.

## Features

-   Fetches Discord roles for each player using your bot and server ID
-   Stores roles in a player statebag as named keys (e.g., `EXAMPLE = true`)
-   Easy client-side access to roles via `LocalPlayer.state.DISCORD_ROLES`
-   Integrate with other scripts for role-locked features (see below)

## Installation

1. Add `bablo-discordroles` to your server's `resources` folder.
2. Add your Discord bot token and server ID in `config.lua`:

    ```lua
    Config.DiscordBot = {
        Token = "YOUR_BOT_TOKEN",
        GuildID = "YOUR_GUILD_ID",
    }

    Config.Roles = {
        ["EXAMPLE"] = "DISCORD_ROLE_ID",
        ["VIP"] = "VIP_ROLE_ID",
    }
    ```

3. Ensure the resource is started before any scripts that depend on it.

## Example Usage

### Checking Roles in Client Scripts

You can check if a player has a role using the statebag:

```lua
if LocalPlayer.state.DISCORD_ROLES and LocalPlayer.state.DISCORD_ROLES.VIP then
    print("You have the VIP role!")
end
```

### Making Animations Exclusive by Discord Role

You can use Discord roles to make certain animations exclusive to specific groups of players in your `bablo-animations` config:

```lua
Config.Groups = {
    ["VIP"] = function()
        local hasAccess = LocalPlayer.state.DISCORD_ROLES and LocalPlayer.state.DISCORD_ROLES.VIP
        return hasAccess
    end,
    ["EXAMPLE"] = function()
        return LocalPlayer.state.DISCORD_ROLES and LocalPlayer.state.DISCORD_ROLES.EXAMPLE
    end,
}
```

Now, only players with the corresponding Discord role will have access to those animation groups.

## Debugging

-   Enable `Config.DEBUG = true` in `config.lua` to print debug info.

## Notes

-   Make sure your Discord bot has the `Guild Members` intent enabled.
-   The script uses Discord role IDs mapped to readable names for easy access.
-   Statebags are automatically updated when a player joins.

## License

MIT
