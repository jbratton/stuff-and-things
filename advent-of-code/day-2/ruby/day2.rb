class Day2
  def initialize(input_file)
    @input = File.readlines(input_file).map(&:chomp)
  end

  def part_1
    @input.map do |lwh|
      (l, w, h) = lwh.split('x').map(&:to_i)
      areas = [l*w, w*h, h*l]
      (2 * areas.inject(&:+)) + areas.min
    end.inject(&:+)
  end

  def part_2
    @input.map do |lwh|
      (l, w, h) = lwh.split('x').map(&:to_i)
      (2 * [l, w, h].sort[0, 2].inject(&:+)) + (l * w * h)
    end.inject(&:+)
  end
end

if __FILE__ == $0
  day_2 = Day2.new('../input.txt')
  puts "part 1: #{day_2.part_1}"
  puts "part 2: #{day_2.part_2}"
end
