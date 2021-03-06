require 'opal-phaser'
require 'examples/lib/load_an_image'

module Main
  class MainController < Volt::ModelController
    def before_index_remove
      @game.phaser_game.destroy
    end
    
    def index_ready
      puts "index ready"
      @game = Game.new
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
