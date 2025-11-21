require 'gosu'

class GameWindow
  WIDTH  = 640
  HEIGHT = 480
  FLOOR  = 460
  COLOR  = Gosu::Color.rgba(120, 100, 255, 255)

  def initialize state_manager
    @state_manager = state_manager
    # @map = Map.new 'maps/map_1.txt'
    @main_floor = Floor.new 0, 445, 18
    @main_floor_2 = Floor.new 150, 350, 5
    @floors = [@main_floor, @main_floor_2]
    @player = Player.new 20, 300, @floors
  end

  def update
    @player.update
    @player.move_left if Gosu.button_down? Gosu::KB_LEFT
    @player.move_right if Gosu.button_down? Gosu::KB_RIGHT
  end

  def button_down id
    case id
    when Gosu::KB_SPACE
      @player.jump if @player.jumps > 0
    end
  end

  def draw
    Gosu.draw_rect 0, 0, WIDTH, HEIGHT, COLOR, z = 0
    # @map.draw
    @player.draw
    @floors.each { |floor| floor.draw }
  end
end
