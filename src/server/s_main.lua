AddEventHandler('playerJoining', function(name, reason, deferals)
    local source = source

    if not source or source == -1 then
        Trace("Invalid source in playerJoining")
        return
    end

    Main:Handle(source)
end)

if Config.DEBUG then
    RegisterCommand("refreshRoles", function(source, args, rawCommand)
        if source == 0 then
            print("This command cannot be run from the console.")
            return
        end

        Main:Handle(source)
    end, false)
end
