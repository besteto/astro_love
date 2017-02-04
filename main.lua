local config  = require('config') 
local gameObj = require('gameObj')
local utils = require('utils')

function love.load()
	math.randomseed( os.time() )
	background = love.graphics.newVideo(config.background)
	
	allthings = {}

	table.insert(allthings, gameObj:new(config.ship))

	for i = 1, config.blackthingNumb do
		table.insert(allthings, gameObj:new(config.blackthing):roaming())
	end
end

function love.update(dt)

	if love.keyboard.isDown('p')         then 
		
		allthings[1]:spawn() 
		for i = 2, config.blackthingNumb+1 do
			allthings[i]:roaming()
		end
	end
	if love.keyboard.isDown('left','a')  then allthings[1]:turn_l() end
	if love.keyboard.isDown('right','d') then allthings[1]:turn_r() end
	if love.keyboard.isDown('up','w')    then allthings[1]:accel()  end
	if love.keyboard.isDown('down','s')  then allthings[1]:brake()  end

	for i = 1, #allthings do
		for j = 1, #allthings do
			if utils.isCrossed(allthings[i],allthings[j]) then
				allthings[i].dS = allthings[i].dS * (-1)
				allthings[j].dS = allthings[j].dS * (-1)
			end
		end
		allthings[i]:update(dt)
	end

	if(not background:isPlaying()) then 
		background:rewind() 
		background:play() 
	end

end

function love.draw()
	love.graphics.draw(background, 0, 0)

	for i = 1, #allthings do
		allthings[i]:draw()
	end
end