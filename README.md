**LuauCord**

LuauCord is a Roblox Studio model that allows you to control a Discord bot directly from Roblox Studio.

Created by ElectricFlows & Bijssels, LuauCord lets you manage your bot with full functionality, except for joining voice calls or accessing microphone/camera. It is designed to be simple and easy to use (also because roblox does NOT allow that).

Features:
- Control a Discord bot entirely from Roblox Studio
- Fully open source
- Easy to understand and modify with example scripts
- Handles interactions, messages, and presence updates

How to Use:
1. Only modify the Bot server script. Changing other parts of the model may break functionality.
2. Use the provided example script to learn how the bot works.
3. Add your bot logic inside the Bot Ready event to ensure your code runs at the correct time.

Important Notes:
- This project is 100% open source, but you are not allowed to redistribute the model.
- LuauCord cannot join voice channels or use microphone/camera features.
- Functions :

LuaCord.AddSlashCommands(commandName, description, func, guildId) guildId is optional !

LuaCord.login() Call this function to actually log your bot to discord.

License:
© ElectricFlows & Bijssels. All rights reserved.
