-- do not edit in this sprint!

local config = require('config') 
local ship   = require('ship')

function love.load()
	background = love.graphics.newVideo(config.background)
	my_ship = ship:new(config.ship)
end

function love.update(dt)

	if love.keyboard.isDown('p')         then my_ship:spawn()  end
	if love.keyboard.isDown('left','a')  then my_ship:turn_l() end
	if love.keyboard.isDown('right','d') then my_ship:turn_r() end
	if love.keyboard.isDown('up','w')    then my_ship:accel()  end
	if love.keyboard.isDown('down','s')  then my_ship:brake()  end

	my_ship:update(dt)

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()

	love.graphics.draw(background, 0, 0)
	my_ship:draw()
end