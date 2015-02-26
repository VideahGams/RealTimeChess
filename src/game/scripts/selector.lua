local selector = {}

selector.image = engine.graphics.newImage(game.path .. "data/images/selector.png")

selector.x = 1 * 64
selector.y = 1 * 64

function selector.setPos(x, y)

	selector.x, selector.y = x, y

end

function selector.setTile(x, y)

	selector.x, selector.y = x * 64, y * 64

end

function selector.draw()

	love.graphics.draw(selector.image, selector.x, selector.y)

end

return selector