# TODO: need a better name
class Generator
  def self.generate(set)
    additions = Set.new
    set.each do |a|
      set.each do |b|
        additions.add(a + b)
      end
    end
    additions = (additions - set)
    generated_sets = additions.map do |a|
      Set.new(set).add(a).to_a.sort
    end
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

  def self.generations(g)
    result = [[1]]
    (1...g).each do
      result = Generator.generate_all(result)
    end
    result
  end
end
