spawn(function()
    if not KRNL_LOADED and not TRIGON_LOADED then
        local gg = getrawmetatable(game)
        local old = gg.__namecall
        setreadonly(gg,false)
        gg.__namecall = newcclosure(function(...)
            local method = getnamecallmethod()
            local args = {...}
            if tostring(method) == "FireServer" then
                if tostring(args[1]) == "RemoteEvent" then
                    if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                        if _G.AutoFarm and MagnetDoughtDF then
                            if tostring(typeof(args[2])) == "CFrame" then
                                args[2] = PosMonDoughtOpenDoorDF
                            elseif tostring(typeof(args[2])) == "Vector3" then
                                args[2] = PosMonDoughtOpenDoorDF.Position
                            end
                            return old(unpack(args))
                        end
                    end
                end
            end
            return old(...)
        end)
    end
end)
