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
    result = []
    sets.each do |set|
      additions = Generator.generate(set)
      additions.each do |addition|
        result.push(addition)
      end
    end
    result.sort
  end
end
