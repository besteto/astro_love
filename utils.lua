local utils = {}

local abs = math.abs
local sin = math.sin
local sqrt = math.sqrt
local eps = 1e-7


function utils.isNearNull(numb)
	if abs(numb) < eps then
		return true
	end
	return false
end

return utils