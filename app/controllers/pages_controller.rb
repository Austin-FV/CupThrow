class PagesController < ApplicationController
  def home
  end

  def play
  end

  def game
    @player = Player.new(current_user.name)
    @computer = Player.new("Computer")

    for i in 0..current_user.coins - 1
      @player.store(Coin.new(0.25))
      @computer.store(Coin.new(0.25))
    end

    for i in 0..current_user.die - 1
      @player.store(Die.new(6, :white))
      @computer.store(Die.new(6, :white))
    end

    @player.load({},:all);
    @computer.load({}, :all);

    @results_player = @player.throw
    @results_computer = @computer.throw

    # puts @results_player.results

    @player_total = 0
    @computer_total = 0

    for i in 0 .. @results_player.results.length - 1
      @player_total += @results_player.results[i]
    end

    for i in 0 .. @results_computer.results.length - 1
      @computer_total += @results_computer.results[i]
    end

    puts @player_total
    puts @computer_total

    @add = 0

    if @player_total > @computer_total
      # puts @player.name + " WINS!"
      flash.now[:success] = "YOU WIN!" 
      @add = @player_total - @computer_total
    elsif @player_total == @computer_total
      # puts "TIE"
      flash.now[:warning] = 'TIE' 

    else
      # puts "YOU LOSE"
      flash.now[:danger] = 'YOU LOSE' 
    end

    @add = current_user.points + @add

    # puts current_user.points

    current_user.update(points: @add)

  end

end
