local config = 
{
	background   = 'content/common/back.ogv',

	ship = {
		img = "content/ships/ship.png",
		x = 100,
		y = 100,
		rotation = 0,
		deltaRotation = 0.1,
		deltaSpeed = 10,
		coefBrake = 0.8,
		coefInertia = 0.98,
	},

	blackthing = {
		img = "content/npc/blackthing.png",
		x = 100,
		y = 100,
		rotation = 0,
		deltaRotation = 0.1,
		deltaSpeed = 10,
		coefBrake = 0.8,
		coefInertia = 1,
	}

}

return config