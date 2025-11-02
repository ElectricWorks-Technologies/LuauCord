-- HTTP SERVICE NEEDS TO BE ON !

local LuaCord = require(game.ServerScriptService.Discord.Init)
local DataSend = require(script.Parent.Discord.Content.DataSend)
local Interaction = require(script.Parent.Discord.Content.Interaction)[2]
local HS = game:GetService("HttpService")

LuaCord.init({
	Token = "", -- Bot token
	ApplicationId = "", -- ApplicationId
	Intents = {
		Presence = true,
		ServerMembers = true,
		MessageContent = true,
		Messages = true
	}, -- Intents
	Presence = {
		["status"] = "online",
		activities = {
			{
				name = "I'am online",
				type = 0
			}
		}
	} -- Presences
})

LuaCord.event("READY", function(user)
	print("✅ Bot logged in as " .. user.user.username)
end) -- Exemple

LuaCord.event("MESSAGE_CREATE", function(message)
	if message.content == "ping" then
		DataSend.send(message.channel_id, HS:JSONEncode({
			content = "pong",
			message_reference = {
				message_id = message.id
			}
		}))
	end
end) -- Messages Exemple

LuaCord.event("INTERACTION_CREATE",function(interaction)
	if Interaction.isButton(interaction) then
		if Interaction.getButtonId(interaction) == "getbot_version" then
			DataSend.send(interaction.channel_id, HS:JSONEncode({
				content = "Button clicked"
			}))
			Interaction.finish(interaction)
		end
	end
end) -- Interaction exemple

LuaCord.AddSlashCommands("test", "testing", function(interaction)
	Interaction.reply(interaction, {content = "BLEH"}, false)
end,"REPLACE_WITH_BOT_ID") -- Create command

LuaCord.login() -- Log in the bot

task.wait()
DataSend.send("REPLACE_WITH_CHANNEL_ID",HS:JSONEncode({
	content = "Hello from Roblox",
	embeds = {
		{
			title = "Roblox",
			description = "If I see this it means that the bot was **able** to send a message from roblox",
			footer = {
				text = "Send by Roblox OMG 😱😱"
			}
		}
	},
	components = {
		{
			type = 1,
			components = {
				{
					type = 2,
					style = 4,
					label = "💾Get Version💾",
					custom_id ="getbot_version"
				},
				{
					type = 2,
					style = 5,
					label = "Roblox",
					url ="https://www.roblox.com/"
				},
			}
		}
	}
})) -- Send messages exemple
