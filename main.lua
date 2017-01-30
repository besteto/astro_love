local abs = math.abs
local sin = math.sin
local sqrt = math.sqrt

local config = require 'config' 
local ship = config.ship
local eps = config.epsilon
local di = config.deltaInertia

function isNearNull(numb)
	if abs(numb) < eps then
		numb = 0
	else 
		numb = numb * di
	end
	return numb
end

function love.load()
	background = love.graphics.newVideo(config.background)
	shipImg = love.graphics.newImage(ship.img)
	dR = 0
	dS = 0
end

function love.update(dt)
	if love.keyboard.isDown('left','a') then
		dR = dR - ship.deltaRotation
	end
	if love.keyboard.isDown('right','d') then
		dR = dR + ship.deltaRotation
	end

	if love.keyboard.isDown('up','w') then
		dS = dS + ship.deltaSpeed
	end
	if love.keyboard.isDown('down','s') then
		dS = dS - ship.deltaSpeed
		if dS < 0 then
			dS = 0
		end
	end

    ship.x = ship.x + dS * dt * math.sin(ship.rotation)
    ship.y = ship.y - dS * dt * math.cos(ship.rotation)
	ship.rotation = ship.rotation + dR*dt

	dR = isNearNull(dR)
	dS = isNearNull(dS)

	if ship.x < 0 then
		ship.x = love.graphics.getWidth()
	end
	if ship.x > love.graphics.getWidth() then
		ship.x = 0
	end
	if ship.y < 0 then
		ship.y = love.graphics.getHeight()
	end
	if ship.y > love.graphics.getHeight() then
		ship.y = 0
	end

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()
	love.graphics.draw(background, 0, 0)
	love.graphics.draw(shipImg, ship.x, ship.y, ship.rotation, 1, 1, shipImg:getHeight()/2, shipImg:getWidth()/2)
end