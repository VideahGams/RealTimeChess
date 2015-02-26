local board = {}

function board.toTileX(x)
	return (x + 1) / 64
end

function board.toTileY(y)
	return (y + 1) / 64
end

function board.toPosX(x)
	return (x + 1) * 64
end

function board.toPosY(y)
	return (y + 1) * 64
end

return board