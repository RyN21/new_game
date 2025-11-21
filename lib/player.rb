require 'pry'

class Player
  WIDTH  = 35
  HEIGHT = 35

  attr_accessor :x, :y, :state, :jumps


  def initialize x, y, floors
    @x = x
    @y = y
    @floors = floors
    @jump_velocity = 12
    @gravity_velocity = 0.1
    @speed = 5
    @player = Gosu::Image.new 'images/dark_purple_ball.png'
    @state = :off_ground
    @jumps = 2
  end

  def update
    handle_state
    @state = :on_ground if on_ground? == true
    @player.state = :off_ground if on_ground? == false
  end

  def draw
    @player.draw x, y, 0, 1, 1
  end

  def move_left
    @x -= @speed unless @x <= 0
  end

  def move_right
    @x += @speed unless @x + WIDTH >= 640
  end

  def handle_state
    case @state
    when :on_ground
      @gravity_velocity = 0.1
      @jumps = 2
      @jump_velocity = 12
    when :off_ground
      enable_jump
      enable_gravity if @jump_velocity == 0
    end
  end

  # def off_ground?
  #   @floors.each do |floor|
  #     if @ball_bottom == floor.y
  #       @y = floor.y + 35
  #       @state = :on_ground
  #       return true
  #     else
  #       return false
  #     end
  #   end
  # end

  def on_ground?
    @floors.each do |floor|

      if @y + 35 >= floor.y &&
        @y + 35 < floor.y + 9 &&
        @x >= floor.left_x &&
        @x + 35 <= floor.right_x
        return true
      else
        false
      end
    end
  end

  def enable_jump
    @state = :off_ground
    @y -= @jump_velocity
    @jump_velocity -= 0.50
  end

  def enable_gravity
    @y += @gravity_velocity
    @gravity_velocity += 0.1 if @gravity_velocity < 2
  end

  def jump
    @state = :off_ground
    @jumps -= 1
    @jump_velocity = 12
  end
end
