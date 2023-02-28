lib.locale()

local channels = {
  channel = 'webhooLink',
}

exports('SendLog', function(channel, color, tittle, message, isembed)
  local webhookLink = channels[channel]
  if not webhookLink then
    print(locale('webhook_error'))
    return
  end
  if isembed then
    local embed = {
      {
        ["color"] = color,
        ["title"] = "**" .. tittle .. "**",
        ["description"] = message,
        ["footer"] = {
          ["text"] = "Made by Dewn",
        },
      }
    }
    RequestSendEmbedLog(webhookLink, tittle, embed)
  else
    message = '```' .. message .. '```'
    RequestSendLog(webhookLink, message)
  end
end)

function RequestSendEmbedLog(webhookLink, tittle, embed)
  PerformHttpRequest(webhookLink, function(err, text, headers)
  end, 'POST', json.encode({ username = tittle, embeds = embed }), { ['Content-Type'] = 'application/json' })
end

function RequestSendLog(webhookLink, message)
  PerformHttpRequest(webhookLink, function(err, text, headers)
  end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
end

exports('AddWebhook', function(channel, webhookLink)
  channels[channel] = webhookLink
end)
