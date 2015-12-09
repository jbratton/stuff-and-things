require 'digest'

class Day4
  def initialize(input_file)
    @input = File.read(input_file).chomp
  end

  def md5_hash(i)
    Digest::MD5.hexdigest('%s%d' % [@input, i])
  end

  def for_hash_with_n_zeroes(n)
    1.upto(Float::INFINITY) {|i| return i if md5_hash(i)[0, n] == ('0' * n)}
  end

  def part_1
    for_hash_with_n_zeroes 5
  end

  def part_2
    for_hash_with_n_zeroes 6
  end
end

if __FILE__ == $0
  day_4 = Day4.new('../input.txt')
  puts "part 1: #{day_4.part_1}"
  puts "part 2: #{day_4.part_2}"
end
