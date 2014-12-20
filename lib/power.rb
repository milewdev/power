class Power
  class << self

    def find(n)
      find_all(n).first
    end

    def find_all(n)
      power_sets = [[1]]
      loop do
        solutions = power_sets.select { |power_set| power_set.include?(n) }
        return solutions unless solutions.empty?
        power_sets = do_another_multiplication(power_sets)
      end
    end

  private

    def do_another_multiplication(power_sets)
      power_sets.map { |power_set| generate_next_power_sets(power_set) }.flatten(1).uniq.sort
    end

    def generate_next_power_sets(power_set)
      multiplication_combinations(power_set).map { |power| power_set.dup.push(power).sort }   # sort so that uniq can be used later
    end

    def multiplication_combinations(power_set)
      power_set.product(power_set).map { |p1, p2| p1+p2 }.uniq - power_set
    end

  end
end
