class Day5
  def initialize(input_file)
    @input = File.readlines(input_file).map(&:chomp)
  end

  def part_1
    @input.map do |word|
      word.count('aeiou') >= 3 &&
        /([a-z])\1/ === word &&
        !(/(ab|cd|pq|xy)/ === word)
    end.count {|is_nice| is_nice}
  end

  def part_2
    @input.map do |word|
      /([a-z]{2}).*?\1/ === word &&
        /([a-z])[a-z]\1/ === word
    end.count {|is_nice| is_nice}
  end
end

if __FILE__ == $0
  day_5 = Day5.new('../input.txt')
  puts "part 1: #{day_5.part_1}"
  puts "part 2: #{day_5.part_2}"
end
