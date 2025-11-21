require 'gosu'

class Floor
  attr_reader :left_x, :right_x, :y
  def initialize x, y, size
    @left_x = x
    @right_x = x + 35 * size
    @y = y
    @size = size
    @tile = Gosu::Image.new 'images/plain_tile.png'
    @tile_size = 35
  end

  def update; end

  def draw
    position = @left_x
    @size.times do
      @tile.draw position, @y, 0, 1, 1
      position += @tile_size
    end
  end

end
