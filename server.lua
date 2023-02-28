lib.locale()

local channels = {
  channel = 'webhooLink',
  fix = 'https://discord.com/api/webhooks/1080237448396804117/bTpJGq7eR-g_DLgF-N_ywzetVpWK8dSTYFBRHGUMzuTwl5Yxb8TJD86O9ENEDFzMvC-2',
}

function RequestSendLog(webhookLink, message)
  PerformHttpRequest(webhookLink, function(err, text, headers)
  end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
end

function SendLog(channel, message, bool)
  local webhookLink = channels[channel]
  if not webhookLink then
    print(locale('webhook_error'))
    return
  end
  if bool then
    message = '```prolog\n' .. message .. '\r```'
    RequestSendLog(webhookLink, message)
  else
    message = '```prolog\n' .. message .. '\r```'
    RequestSendLog(webhookLink, message)
  end
end

function AddWebhook(channel, webhookLink)
  channels[channel] = webhookLink
end
