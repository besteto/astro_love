local config  = require('config') 
local gameObj = require('gameObj')

function love.load()
	math.randomseed( os.time() )
	background = love.graphics.newVideo(config.background)
	my_ship = gameObj:new(config.ship)
	
	blackthings = {}

	for i = 1, config.blackthingNumb do
		table.insert(blackthings, gameObj:new(config.blackthing):roaming())
	end
end

function love.update(dt)

	if love.keyboard.isDown('p')         then 
		my_ship:spawn() 
		for i = 1, config.blackthingNumb do
			blackthings[i]:roaming()
		end
	end
	if love.keyboard.isDown('left','a')  then my_ship:turn_l() end
	if love.keyboard.isDown('right','d') then my_ship:turn_r() end
	if love.keyboard.isDown('up','w')    then my_ship:accel()  end
	if love.keyboard.isDown('down','s')  then my_ship:brake()  end

	my_ship:update(dt)
	for i = 1, #blackthings do
		blackthings[i]:update(dt)
	end

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()
	love.graphics.draw(background, 0, 0)

	my_ship:draw()
	for i = 1, config.blackthingNumb do
		blackthings[i]:draw()
	end
end