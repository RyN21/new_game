Dir[File.join(File.dirname(__FILE__), "lib", "**.rb")].each do |file|
  require file
end

require 'bundler/setup'
require 'gosu'
require_relative 'lib/state_manager'
# require_relative 'lib/main_menu'
require_relative 'lib/game_window'

class Main < Gosu::Window

  WIDTH  = 640
  HEIGHT = 480
  TITLE  = "My Game"

  def initialize
    super WIDTH, HEIGHT
    self.caption = TITLE
    @state_manager = StateManager.new self

    @state_manager.switch_to GameWindow.new @state_manager
  end

  def update
    @state_manager.update
  end

  def draw
    @state_manager.draw
  end

  def button_down id
    @state_manager.button_down id
  end
end

Main.new.show
