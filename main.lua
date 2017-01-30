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
end

function love.update(dt)
	if love.keyboard.isDown('left','a') then
		dR = dR - ship.deltaRotation
	end
	if love.keyboard.isDown('right','d') then
		dR = dR + ship.deltaRotation
	end

	if love.keyboard.isDown('up','w') then
      ship.x = ship.x + ship.deltaSpeed*dt * math.sin(ship.rotation)
      ship.y = ship.y - ship.deltaSpeed*dt * math.cos(ship.rotation)
	end
	if love.keyboard.isDown('down','s') then
      ship.x = ship.x - ship.deltaSpeed*dt * math.sin(ship.rotation)
      ship.y = ship.y + ship.deltaSpeed*dt * math.cos(ship.rotation)
	end

 	--ship.x = ship.x + ship.xVelocity*dt
	--ship.y = ship.y + ship.yVelocity*dt

	ship.rotation = ship.rotation + dR*dt
	
	dR = isNearNull(dR)
	ship.xVelocity = isNearNull(ship.xVelocity)
	ship.yVelocity = isNearNull(ship.yVelocity)


	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()
	love.graphics.draw(background, 0, 0)
	love.graphics.draw(shipImg, ship.x, ship.y, ship.rotation, 1, 1, shipImg:getHeight()/2, shipImg:getWidth()/2)
end