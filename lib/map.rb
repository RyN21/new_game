TILE_SIZE = 35

class Map
  attr_reader :width, :height

  def initialize filename
    @tile   = Gosu::Image.new 'images/plain_tile.png'

    lines   = File.readlines(filename).map { |line| line.chomp }
    @height = lines.size
    @width  = lines[0].size
    @tiles  = Array.new @width do |x|
      Array.new @height do |y|
        case lines[y][x, 1]
        when 'x'
          Gosu::Image.new 'images/plain_tile.png'
        else
          nil
        end
      end
    end
  end

  def draw
    @height.times do |x|
      @width.times do |y|
        tile = @tiles[x][y]
        if tile
          @tile.draw(x * 35, y * 35, 0)
        end
      end
    end
  end
end
