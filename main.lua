local config = require('config') 
local gameObj   = require('gameObj')

function love.load()
	background = love.graphics.newVideo(config.background)
	my_ship = gameObj:new(config.ship)
	blackthing = gameObj:new(config.blackthing)
	
	function blackthing:spawn ()
		self.x = math.random(love.graphics.getWidth())
		self.y = math.random(love.graphics.getHeight())
		self.dR = math.random(-10,10)
		self.coefInertia = 1
	end

	blackthing:spawn()
end

function love.update(dt)

	if love.keyboard.isDown('p')         then 
		my_ship:spawn() 
		blackthing:spawn() 
	end
	if love.keyboard.isDown('left','a')  then my_ship:turn_l() end
	if love.keyboard.isDown('right','d') then my_ship:turn_r() end
	if love.keyboard.isDown('up','w')    then my_ship:accel()  end
	if love.keyboard.isDown('down','s')  then my_ship:brake()  end

	my_ship:update(dt)
	blackthing:update(dt)

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()
	love.graphics.draw(background, 0, 0)

	my_ship:draw()
	blackthing:draw()
end