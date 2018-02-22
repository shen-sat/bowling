require_relative '../lib/game'

describe 'Game' do 
	it 'should calculate the score for 20 rolls of 1 pin each as 20' do 
		game = Game.new
		20.times {game.roll(1)}
		game.make_frames
		game.sum
		expect(game.total).to eq(20)
	end

	it 'should package rolls into frames' do 
		game = Game.new
		4.times {game.roll(1)}
		game.make_frames
		expect(game.frames).to eq([[1,1],[1,1]])
	end

	
end
