
local config = 
{
	background   = 'content/common/back.ogv',
	epsilon = 1e-7,
	deltaInertia = 0.98,
	
	ship = {
		img = "content/ships/ship.png",
		x = 100,
		y = 100,
		rotation = 0,
		deltaRotation = 0.1,
		deltaSpeed = 100,
		xVelocity = 0,
		yVelocity = 0,
	}

}

return config