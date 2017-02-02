local math = math
local utils = require('utils')

local gameObj = {}

function gameObj:new(config)
	local obj = {}  
		
	obj.image = love.graphics.newImage(config.img) 
	obj.dR = 0;
	obj.dS = 0 
	obj.x 			  = config.x             or 0
	obj.y 			  = config.y             or 0
	obj.rotation 	  = config.rotation      or 0
	obj.deltaRotation = config.deltaRotation or 0
	obj.deltaSpeed 	  = config.deltaSpeed    or 0
	obj.coefBrake     = config.coefBrake 	 or 0
	obj.coefInertia   = config.coefInertia   or 0
	
	obj.centerX = obj.image:getWidth()/2
	obj.centerY = obj.image:getHeight()/2

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
end	

function gameObj:update(dt)
	self.rotation = self.rotation + self.dR * dt

	self.x = self.x + self.dS * dt * math.sin(self.rotation)
    self.y = self.y - self.dS * dt * math.cos(self.rotation)
	
	if self.x < 0 then
 		self.x = love.graphics.getWidth()
 	end
 	if self.x > love.graphics.getWidth() then
 		self.x = 0
 	end
 	if self.y < 0 then
 		self.y = love.graphics.getHeight()
 	end
 	if self.y > love.graphics.getHeight() then
 		self.y = 0
 	end

	if self.dR  then self.dR = utils.round_null(self.dR * self.coefInertia) end
	if self.dS  then self.dS = utils.round_null(self.dS * self.coefInertia) end

end	

function gameObj:turn_l()
	self.dR = self.dR - self.deltaRotation
end	

function gameObj:turn_r()
	self.dR = self.dR + self.deltaRotation
end	

function gameObj:accel()
	self.dS = self.dS + self.deltaSpeed
end	

function gameObj:brake()
	self.dS = self.dS * self.coefBrake
end	

function gameObj:roaming()
	self.x  = math.random(0, love.graphics.getWidth())
	self.y  = math.random(0, love.graphics.getHeight())
	self.dR = math.random(-5,5)
	return self
end

return gameObj