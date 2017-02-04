local config = 
{
	background   = 'content/common/back.ogv',
	blackthingNumb = 5,

	ship = {
		img = "content/ships/ship.png",
		x = 100,
		y = 100,
		rotation = 0,
		deltaRotation = 0.1,
		deltaSpeed = 10,
		coefBrake = 0.8,
		coefInertia = 0.98,
		isNPC = false,
	},

	blackthing = 
	{
		img = "content/npc/blackthing.png",
		coefInertia = 1,
		isNPC = true,
	}

}

return config