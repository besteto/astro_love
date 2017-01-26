local abs = math.abs
local sin = math.sin
local sqrt = math.sqrt

local config = require 'config' 
local ship = require 'ship'

function love.load()
	background = love.graphics.newVideo(config.background)
	ship.img = love.graphics.newImage("content/ships/ship.png")
end

function love.update(dt)
	if love.keyboard.isDown('left','a') then
		ship.rotation = ship.rotation + ship.deltaRotation
	elseif love.keyboard.isDown('right','d') then
		ship.rotation = ship.rotation - ship.deltaRotation
	end

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	love.graphics.draw(ship.img, love.graphics.getWidth()/2, love.graphics.getHeight()/2, ship.rotation, 1, 1, ship.img:getHeight()/2, ship.img:getWidth()/2)
end