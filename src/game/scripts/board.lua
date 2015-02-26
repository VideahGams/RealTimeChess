local board = {}

board.columns = {"a", "b", "c", "d", "e", "f", "g", "h"}
board.rows = {1, 2, 3, 4, 5, 6, 7, 8}

function board.toCoordsX(x)
	return board.columns[x / 64]
end

function board.toCoordsY(y)
	return board.rows[y / 64]
end

function board.toCoords(x, y)
	return tostring(board.columns[y] .. board.rows[x])
end

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