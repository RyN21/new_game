class Player
  WIDTH  = 35
  HEIGHT = 35

  attr_accessor :x, :y, :state, :on_ground


  def initialize x, y
    @x = x
    @y = y - HEIGHT
    @jump_velocity = 12
    @player = Gosu::Image.new('images/dark_purple_ball.png')
    @state = :on_ground
  end

  def update
    handle_state
  end

  def draw
    @player.draw x, y, 0, 1, 1
  end

  def move_left
    @x -= 7 unless @x <= 0
  end

  def move_right
    @x += 7 unless @x + WIDTH >= 640
  end

  def handle_state
    case @state
    when :on_ground
      @y = 460 - HEIGHT
      @jump_velocity = 12
    when :jumping
      jump
    end
  end

  def enable_jump
    @state = :jumping
  end

  def jump
    @y -= @jump_velocity
    @jump_velocity -= 0.75
    @state = :on_ground if @y + HEIGHT >= 460
  end
end
