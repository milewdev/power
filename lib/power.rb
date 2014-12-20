class Power
  def self.find(n)
    find_all(n).first
  end

  def self.find_all(n)
    power_sets = [[1]]
    loop do
      solutions = power_sets.select { |set| set.include?(n) }
      return solutions unless solutions.empty?
      power_sets = generate_all_next_power_sets(power_sets)
    end
  end

  def self.generate_all_next_power_sets(power_sets)
    power_sets.map { |power_set| generate_next_power_sets(power_set) }.flatten(1).uniq.sort
  end

  def self.generate_next_power_sets(power_set)
    next_powers(power_set).map { |power| power_set.dup.push(power).sort }
  end

  def self.next_powers(power_set)
    power_set.product(power_set).map { |p1, p2| p1+p2 }.uniq - power_set
  end
end
