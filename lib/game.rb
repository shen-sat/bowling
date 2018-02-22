class Game
	attr_accessor :frames, :total

	def initialize
		@rolls = []
		@frames = []
		@total = 0
	end


	def roll(pins)
		@rolls.push(pins)
		@rolls.push(0) if pins == 10 
	end

	def make_frames
		@rolls.each_with_index { |roll, i| @frames.push([roll, @rolls[i+1]]) unless (i+1).even? }
	end

	def sum
		@frames.each_with_index do |frame, ind|
			frame_total = frame.reduce(:+)
			if frame_total == 10
				@total += frame_total
				@total += frames[ind + 1][0]
			else
				@total += frame_total
			end
		end
	end
end
