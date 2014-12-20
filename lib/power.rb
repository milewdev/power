# 'require' all files except ourselves.
me = File.absolute_path(__FILE__)
Dir.glob(File.dirname(me) + '/**/*.rb') { |fn| require fn unless fn == me }


class Power

  MaxAttempts = 7

  def self.find(n)
    find_all(n).first
  end

  def self.find_all(n)
    power_sets = [[1]]
    (1..MaxAttempts).each do
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

  def self.generate_next_power_sets(power_set)
    next_powers(power_set).map { |power| power_set.dup.push(power).sort }
  end

  def self.next_powers(power_set)
    power_set.product(power_set).map { |p1, p2| p1+p2 }.uniq - power_set
  end
end
