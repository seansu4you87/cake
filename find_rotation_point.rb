module FindRotationPoint
  extend self

  def find(words)
  	first_word = words[0]
  	floor_index = 0
  	ceiling_index = words.length - 1

  	while floor_index < ceiling_index
  		guess_index = floor_index + ((ceiling_index - floor_index) / 2)

  		if words[guess_index] > first_word
  			floor_index = guess_index
  		else
  			ceiling_index = guess_index
  		end

  		if floor_index + 1 == ceiling_index
  			return ceiling_index
  		end
  	end
  end

  def _find(words)
  	if words[0] > words[1]
  		return 1
  	end

  	midpoint = words.length / 2
  	head_floor = 0
  	if words.length.odd?
  		head_ceil = midpoint
  		tail_floor = midpoint
  	else
  		head_ceil = midpoint
  		tail_floor = midpoint + 1
  	end
  	tail_ceil = words.length

  	head_sorted = sorted?(words, head_floor, head_ceil)
  	tail_sorted = sorted?(words, tail_floor, tail_ceil-1)
  	if head_sorted && tail_sorted
  		tail_floor
  	elsif head_sorted
  		midpoint + 1 + find(words[tail_floor..tail_ceil])
  	elsif tail_sorted
  		find(words[head_floor..head_ceil])
  	end
  end

  private

  def sorted?(array, first, last)
  	array[first] <= array[last]
  end
end
