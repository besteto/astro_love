local utils = {}

local abs = math.abs
local sin = math.sin
local sqrt = math.sqrt
local eps = 1e-7

function utils.round_null(num)
	if abs(num) < eps then return 0 end
	return num
end	



return utils