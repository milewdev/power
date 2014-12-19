# TODO: need a better name
class Generator
  def self.generate(set)                    # [1,2]
    additions = generate_new_numbers(set)   # [2,3,4]
    additions = (additions - set)           # [3,4]
    generated_sets = additions.map do |a|
      Set.new(set).add(a).to_a.sort
    end
  end

  def self.generate_new_numbers(list)   # [1,2]
    new_numbers = Set.new
    list.each do |i|                    # i = 1,2
      list.each do |j|                  # j = 1,2
        new_number = i + j              # 1+1=2, 1+2=3, 2+1=3, 2+2=4
        new_numbers.add(new_number)     # {2,3,4}  new_numbers a set, so 3 only added once
      end
    end
    new_numbers.to_a
  end

  def self.generate_all(sets)
    result = Set.new
    sets.each do |set|
      additions = Generator.generate(set)
      additions.each do |addition|
        result.add(addition)
      end
    end
    result.to_a.sort
  end

  def self.find(n)
    sets = [[1]]
    (0..7).each do
      sets.each do |set|
        return set if set.include?(n)
      end
      sets = Generator.generate_all(sets)
    end
    []  # TODO: need to fail here
  end

  def self.find_all(n)
    sets = [[1]]
    (0..7).each do
      solutions = sets.select {|set| set.include?(n) }
      return solutions unless solutions.empty?
      sets = Generator.generate_all(sets)
    end
    []  # TODO: need to fail here
  end
end
