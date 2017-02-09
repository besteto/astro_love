local math = math
local utils = require('utils')

local gameObj = {}

function gameObj:new(config)
	local obj = {}  
		
	obj.image = love.graphics.newImage(config.img) 
	obj.dR = 0
	obj.dSx = 0
	obj.dSy = 0
			 
	obj.x 			  = config.x             or 0
	obj.y 			  = config.y             or 0
	obj.rotation 	  = config.rotation      or 0
	obj.deltaRotation = config.deltaRotation or 0
	obj.deltaSpeed 	  = config.deltaSpeed    or 0
	obj.coefBrake     = config.coefBrake 	 or 0
	obj.coefInertia   = config.coefInertia   or 0
	obj.isNPC		  = config.isNPC
	
	obj.collisionR 	  = (obj.image:getWidth()+obj.image:getHeight())/4
	obj.centerX 	  = obj.image:getWidth()/2
	obj.centerY 	  = obj.image:getHeight()/2

	setmetatable(obj,self)
   	self.__index   = self
	return obj
end

function gameObj:spawn()
	self.x = love.graphics.getWidth() /2  
	self.y = love.graphics.getHeight()/2  
end

function gameObj:draw()
	love.graphics.draw(self.image, self.x, self.y, self.rotation, 1, 1, self.centerX, self.centerY)
	love.graphics.circle("line", self.x, self.y, self.collisionR, 50)
end	

function gameObj:update(dt)
	self.rotation = self.rotation + self.dR * dt

	
    if self.isNPC then
    	if self.x < 0 or self.x > love.graphics.getWidth() 	then
    		self.dSx = -self.dSx
    	end
    	if self.y < 0 or self.y > love.graphics.getHeight() then 
	 		self.dSy = -self.dSy
	 	end
	 	self.x = self.x + self.dSx
    	self.y = self.y + self.dSy
    else
		if self.x < 0 then self.x = love.graphics.getWidth() end
	 	if self.x > love.graphics.getWidth() then self.x = 0 end
	 	if self.y < 0 then self.y = love.graphics.getHeight() end
	 	if self.y > love.graphics.getHeight() then self.y = 0 end

	 	self.x = self.x + self.dSx * dt * math.sin(self.rotation)
    	self.y = self.y - self.dSy * dt * math.cos(self.rotation)
	end

	if self.dR   then self.dR  = utils.round_null(self.dR * self.coefInertia) end
	if self.dSx  then self.dSx = utils.round_null(self.dSx * self.coefInertia) end
	if self.dSy  then self.dSy = utils.round_null(self.dSy * self.coefInertia) end

end	

function gameObj:turn_l()
	self.dR = self.dR - self.deltaRotation
end	

function gameObj:turn_r()
	self.dR = self.dR + self.deltaRotation
end	

function gameObj:accel()
	self.dSx = self.dSx + self.deltaSpeed
	self.dSy = self.dSy + self.deltaSpeed
end	

function gameObj:brake()
	self.dSx = self.dSx * self.coefBrake
	self.dSy = self.dSy * self.coefBrake
end	

function gameObj:roaming()
	self.x  = math.random(0, love.graphics.getWidth())
	self.y  = math.random(0, love.graphics.getHeight())
	self.dR = math.random(-.5,.5)
	self.dSx = math.random(1,5)
	self.dSy = math.random(1,5)
	return self
end

return gameObj