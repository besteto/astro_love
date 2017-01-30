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
		dR = dR + ship.deltaRotation
	elseif love.keyboard.isDown('right','d') then
		dR = dR - ship.deltaRotation
	end

	ship.rotation = ship.rotation + dR
	dR = isNearNull(dR)

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()
	love.graphics.draw(background, 0, 0)
	love.graphics.draw(shipImg, love.graphics.getWidth()/2, love.graphics.getHeight()/2, ship.rotation, 1, 1, shipImg:getHeight()/2, shipImg:getWidth()/2)
end