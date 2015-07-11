if RUBY_PLATFORM == 'opal'
  class Image
    def initialize(game)
      @sprite_key = "einstein"
      @sprite_url = "/assets/ra_einstein.png"
      @game       = game
    end
  
    def preload
      @game.load.image(@sprite_key, @sprite_url)
    end
  
    def create
      @game.add.sprite(0, 0, @sprite_key)
    end
  end


  class Game
    attr_reader :phaser_game
    def initialize
      @phaser_game  = Phaser::Game.new(width: 800, height: 600, renderer: Phaser::CANVAS, parent: "example")
      state = MainState.new(@phaser_game)
      @phaser_game.state.add(:main, state, true)
    end
  end

  class MainState < Phaser::State
    def initialize(game)
      @game = game
    end
  
    def preload
      @image = Image.new(@game)
      @image.preload
    end
  
    def create
      @image.create
    end
  end
end