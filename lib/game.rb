class Game
	attr_accessor :frames, :total

	def initialize
		@rolls = []
		@frames = []
		@total = 0
	end


	def roll(pins)
		@rolls.push(pins) 
	end

	def make_frames
		@rolls.each_with_index { |roll, i| @frames.push([roll, @rolls[i+1]]) unless (i+1).even? }
	end

	def sum
		@frames.each do |frame|
			@total += frame.reduce(:+)
		end
		#@rolls.reduce(:+)
	end
end
