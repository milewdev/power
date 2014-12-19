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
end
