chessBase = engine.class('chessBase')

function chessBase:initialize(tilex, tiley)

	tilex = tilex or 1
	tiley = tiley or 1

	self.tilex = tilex * 64
	self.tiley = tiley * 64
	print("Created")

end

function chessBase:move(tilex, tiley)

	self.tilex = tilex * 64
	self.tiley = tiley * 64
	print("Moved")

end

pawn = chessBase:new()