class Day1
  def initialize(input_file)
    @input = File.read(input_file).chomp
  end
  
  def char_map
    return @char_map unless @char_map.nil?
    @char_map = Hash.new(0)
    @char_map['('] = 1
    @char_map[')'] = -1
    @char_map
  end

  def part_1
    @input.each_char.map {|char| char_map[char]}.inject(&:+)
  end

  def part_2
    floor = 0
    @input.each_char.each_with_index do |char, index|
      floor += char_map[char]
      return index + 1 if floor < 0
    end
  end
end

if __FILE__ == $0
  day1 = Day1.new '../input.txt'
  puts "part 1: #{day1.part_1}"
  puts "part 2: #{day1.part_2}"
end
