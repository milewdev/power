# 'require' all files except ourselves.
me = File.absolute_path(__FILE__)
Dir.glob(File.dirname(me) + '/**/*.rb') {|fn| require fn unless fn == me }


class Array
  def set_add(o)
    self.push(o) unless self.include?(o)
  end
end


class Power
  def self.find(n)
    power_set_collection = [[1]]
    (0..7).each do
      power_set_collection.each do |power_set|
        return power_set if power_set.include?(n)
      end
      power_set_collection = generate_all_next_power_sets(power_set_collection)
    end
    []  # TODO: need to fail here
  end

  def self.find_all(n)
    sets = [[1]]
    (0..7).each do
      solutions = sets.select {|set| set.include?(n) }
      return solutions unless solutions.empty?
      sets = generate_all_next_power_sets(sets)
    end
    []  # TODO: need to fail here
  end

  def self.generate_all_next_power_sets(power_sets)
    result = []
    power_sets.each do |set|
      additions = generate_next_power_sets(set)
      additions.each do |addition|
        result.set_add(addition)
      end
    end
    result.sort
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
        next_powers.set_add(next_power)               # [2,3,4]  note: set_add drops second 3
      end
    end
    next_powers - power_set                           # [2,3,4] - [1,2] = [3,4]
  end

  def self.build_power_sets(power_set, next_powers)   # [1,2], [3,4]
    next_powers.map do |next_power|
      build_power_set(power_set, next_power)
    end                                               # [1,2, 3] and [1,2, 4]
  end

  def self.build_power_set(power_set, next_power)     # [1,2,4], 3
    power_set                                         # [1,2,4]
    .dup                                              # [1,2,4]
    .set_add(next_power)                              # [1,2,4,3]  note: set_add drops duplicates
    .sort                                             # [1,2,3,4]
  end
end
