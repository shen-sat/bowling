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

	it 'should have a total score of 12 for half strike in first frame' do
		game = Game.new
		game.roll(4)
		game.roll(6)
		game.roll(1)
		17.times {game.roll(0)}
		game.make_frames
		game.sum
		expect(game.total).to eq(12)
	end

	it 'should automatically give a second roll of 0 for first roll 10' do 
		game = Game.new
		game.roll(10)
		game.make_frames
		expect(game.frames).to eq([[10,0]])
	end

	it 'should calculate a total score of 13 for a first-frame strike' do
		game = Game.new
		game.roll(10)
		game.roll(1)
		game.roll(1)
		16.times {game.roll(0)}
		game.make_frames
		game.sum
		expect(game.total).to eq(14)
	end	
end
