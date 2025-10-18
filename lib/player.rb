class Player
  WIDTH  = 35
  HEIGHT = 35

  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
    @player = Gosu::Image.new('images/dark_purple_ball.png')
  end

  def update; end

  def draw
    @player.draw x, y, 0, 1, 1
  end

  def move_left
    @x -= 7 unless @x <= 0
  end

  def move_right
    @x += 7 unless @x + WIDTH >= 640
  end

  def move_up
    @y -= 7 unless @y <= 0
  end

  def move_down
    @y += 7 unless @y + HEIGHT >= 480
  end
end
