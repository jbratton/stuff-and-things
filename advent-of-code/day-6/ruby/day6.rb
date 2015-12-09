class Day6
  def initialize(input_file)
    @input = File.readlines(input_file).map(&:chomp)
  end

  def instructions
    @instructions ||= @input.map {|line| parse_instruction line }
  end

  def parse_instruction(instruction)
    parse_coordinates(instruction).push parse_command(instruction)
  end

  def parse_coordinates(instruction)
    instruction =~ /(\d+,\d+) through (\d+,\d+)/
    [$1.split(',').map(&:to_i), $2.split(',').map(&:to_i)]
  end

  def parse_command(instruction)
    case instruction
    when /^turn on/
      :on
    when /^turn off/
      :off
    when /^toggle/
      :toggle
    end
  end

  def new_grid(light_start_state)
    Array.new(1000) { Array.new(1000) { light_start_state } }
  end

  def part_1_command_map
    @part_1_command_map ||= {
      :on => ->(state) { true },
      :off => ->(state) { false },
      :toggle => ->(state) { not state }
    }
  end

  def part_2_command_map
    @part_2_command_map ||= {
      :on => ->(state) { state + 1 },
      :off => ->(state) { [state - 1, 0].max },
      :toggle => ->(state) { state + 2 }
    }
  end

  def run_part(command_map, light_start_state)
    lights = new_grid light_start_state
    instructions.each do |((start_x, start_y), (end_x, end_y), command)|
      start_x.upto(end_x) do |x|
        start_y.upto(end_y) do |y|
          lights[x][y] = command_map[command].call lights[x][y]
        end
      end
    end
    lights
  end

  def part_1
    run_part(part_1_command_map, false).map {|row| row.count {|is_lit| is_lit}}.inject(&:+)
  end

  def part_2
    run_part(part_2_command_map, 0).map {|row| row.inject(&:+)}.inject(&:+)
  end
end

if __FILE__ == $0
  day_6 = Day6.new('../input.txt')
  puts "part 1: #{day_6.part_1}"
  puts "part 2: #{day_6.part_2}"
end
