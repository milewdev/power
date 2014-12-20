# 'require' all files except ourselves.
me = File.absolute_path(__FILE__)
Dir.glob(File.dirname(me) + '/**/*.rb') { |fn| require fn unless fn == me }


class Power

  @attempts = 1..7

  def self.find(n)
    find_all(n).first
  end

  def self.find_all(n)
    power_sets = [[1]]
    @attempts.each do
      solutions = power_sets.select { |set| set.include?(n) }
      return solutions unless solutions.empty?
      power_sets = generate_all_next_power_sets(power_sets)
    end
    []  # TODO: need to fail here
  end

  def self.generate_all_next_power_sets(power_sets)
    next_power_sets = power_sets.reduce([]) do |next_power_sets, power_set|
      next_power_sets.concat(generate_next_power_sets(power_set))
    end
    next_power_sets.uniq.sort
  end

  def self.generate_next_power_sets(power_set)        # [1,2]
    next_powers = generate_next_powers(power_set)     # [1,2] => [3,4]
    build_power_sets(power_set, next_powers)          # [ [1,2,3], [1,2,4] ]
  end

  def self.generate_next_powers(power_set)            # [1,2]
    next_powers = []
    power_set.each do |power1|                        # power1 = 1,2
      power_set.each do |power2|                      # power2 = 1,2
        next_power = power1 + power2                  # 1+1=2, 1+2=3, 2+1=3, 2+2=4
        next_powers.push(next_power)                  # [2,3,3,4]
      end
    end
    next_powers = next_powers.uniq                    # [2,3,3,4] => [2,3,4]
    next_powers - power_set                           # [2,3,4] - [1,2] = [3,4]
  end

  def self.build_power_sets(power_set, powers)        # [1,2], [3,4]
    powers.map do |power|
      power_set.dup.push(power).sort
    end                                               # [1,2, 3] and [1,2, 4]
  end
end
