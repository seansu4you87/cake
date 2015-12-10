module InflightEntertainment
  extend self

  def entertained?(flight_length, movies)
    movies.each_with_index do |first, i|
      left = flight_length - first
      movies.each_with_index do |second, j|
        next if i == j

        return true if left == second
      end
    end

    false
  end
end