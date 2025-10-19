require 'gosu'

class GameWindow
  WIDTH  = 640
  HEIGHT = 480
  FLOOR  = 460
  COLOR  = Gosu::Color.rgba(120, 100, 255, 255)

  def initialize state_manager
    @state_manager = state_manager
    @player = Player.new 20, FLOOR
  end

  def update
    @player.update
    if Gosu.button_down? Gosu::KB_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @player.move_right
    end
  end

  def button_down id
    case id
    when Gosu::KB_SPACE
      @player.enable_jump if @player.state == :on_ground
    end
  end

  def draw
    Gosu.draw_rect(0, 0, WIDTH, HEIGHT, COLOR, z = 0)
    @player.draw
  end
end
