Constants = {
  ProximityMessageDistance = 30,
  DiscordInvite = 'https://discord.gg/Hfxz3Aj',
  SystemPrefix = '^3^*[System]',
}

Format = {
  PM = '^*^7[^3%s ^5=> ^3%s^7]'
}

function RegisterFrameworkCommand (name, handler, restricted)
  if type(name) == 'table' then
    for _, c in ipairs(name) do
      RegisterFrameworkCommand(c, handler, restricted)
    end
  else
    RegisterCommand(name, handler, restricted)
  end
end

function RegisterCommandAlias (command, alias)
  if type(alias) == 'table' then
    for _, a in ipairs(alias) do
      RegisterCommandAlias(command, a)
    end
  else
    RegisterCommand(alias, function (source, args, raw)
      ExecuteCommand(command .. ' ' .. table.concat(args, ' '))
    end)
  end
end

function RegisterCommandSuggestion(command, description, parameters, client)
  if type(command) == 'table' then
    for _, c in ipairs(command) do
      RegisterCommandSuggestion(c, description, parameters)
    end
  else
    TriggerEvent('chat:addSuggestion', '/' .. command, description, parameters)
  end
end

function ContainsNonWhitespaceCharacter(string)
  for i = 1, #string do
    local char = string:sub(i,i)
    if char ~= ' ' then
      return true
    end
  end
  return false
end