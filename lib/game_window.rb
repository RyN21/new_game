require 'gosu'

class GameWindow
  WIDTH  = 640
  HEIGHT = 480
  COLOR  = Gosu::Color.rgba(120, 100, 255, 255)

  def initialize state_manager
    @state_manager = state_manager
    @player = Player.new 20, 20
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT
      @player.move_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT
      @player.move_right
    end
    if Gosu.button_down? Gosu::KB_UP
      @player.move_up
    end
    if Gosu.button_down? Gosu::KB_DOWN
      @player.move_down
    end
    # @player.update
  end

  def draw
    Gosu.draw_rect(0, 0, WIDTH, HEIGHT, COLOR, z = 0)
    @player.draw
  end
end
