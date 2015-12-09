require 'set'

class Day3
  def initialize(input_file)
    @input = File.read(input_file).chomp
  end

  def direction_map
    return @direction_map unless @direction_map.nil?
    @direction_map = Hash.new(0)
    @direction_map.merge!({
      '^' => [0, 1],
      'v' => [0, -1],
      '<' => [-1, 0],
      '>' => [1, 0]
    })
  end

  def part_1
    visited_houses = Set.new
    current_house = [0, 0]
    visited_houses << current_house

    @input.each_char do |char|
      move = direction_map[char]
      current_house = [current_house.first + move.first, current_house.last + move.last]
      visited_houses << current_house
    end

    visited_houses.count
  end

  def part_2
    visited_houses = Set.new
    santa_current_house = [0, 0]
    robot_current_house = [0, 0]
    visited_houses << santa_current_house

    @input.each_char.each_slice(2) do |(santa_char, robot_char)|
      santa_move = direction_map[santa_char]
      robot_move = direction_map[robot_char]

      santa_current_house = [
        santa_current_house.first + santa_move.first,
        santa_current_house.last + santa_move.last
      ]

      robot_current_house = [
        robot_current_house.first + robot_move.first,
        robot_current_house.last + robot_move.last
      ]

      visited_houses << santa_current_house << robot_current_house
    end

    visited_houses.count
  end
end

if __FILE__ == $0
  day_3 = Day3.new('../input.txt')
  puts "part 1: #{day_3.part_1}"
  puts "part 2: #{day_3.part_2}"
end
