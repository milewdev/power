#
# Finds all smallest sets of multiplications required to raise any number to the
# nth power.  #find_all returns all of them, #find returns just the first one.
# See README.md for more details.
#
class Power
  class << self

    # find(9) => [1,2,3,6,9]
    def find(n)
      find_all(n).first
    end

    # find_all(9) => [[1,2,3,6,9], [1,2,4,5,9], [1,2,4,8,9]]
    def find_all(n)
      value_sets = [[1]]
      loop do
        solution_sets = extract_solutions(value_sets, n)
        return solution_sets unless solution_sets.empty?
        value_sets = multiply_each(value_sets)
      end
    end

  private

    # extract_solutions([[1,2,3],[1,2,4],...], 4) => [[1,2,4]]
    def extract_solutions(value_sets, n)
      value_sets.select { |set| set.include?(n) }
    end

    # multiply_each([[1,2,3],[1,2,4],...]) => [[1,2,3,4],[1,2,3,5],[1,2,3,6],[1,2,4,8]]
    def multiply_each(value_sets)
      value_sets                          # [[1,2,3], [1,2,4]]
        .map { |set| multiply(set) }      # [[[1,2,3,4],[1,2,3,5],[1,2,3,6]], [[1,2,3,4],[1,2,4,6],[1,2,4,5],[1,2,4,8]]]
        .flatten(1)                       # [[1,2,3,4],[1,2,3,5],[1,2,3,6],[1,2,3,4],[1,2,4,6],[1,2,4,5],[1,2,4,8]]
        .uniq                             # [[1,2,3,4],[1,2,3,5],[1,2,3,6],[1,2,4,8]]
    end

    # multiply([1,2,3]) => [[1,2,3,4],[1,2,3,5],[1,2,3,6]]
    def multiply(value_set)
      next_values(value_set)                          # [1,2,3] => [4,5,6]
        .map { |value| build_set(value_set, value) }  # [1,2,3,4], [1,2,3,5], [1,2,3,6]
    end

    # build_set([1,2,4], 3) => [1,2,3,4]
    def build_set(value_set, new_value)
      value_set                           # [1,2,4]
        .dup                              # [1,2,4]
        .push(new_value)                  # [1,2,4,3]
        .sort                             # [1,2,3,4]  so that uniq can be used later
    end

    # next_values([1,2,3]) => [4,5,6]
    def next_values(value_set)
      value_set                           # [1,2,3]
        .product(value_set)               # [[1,1],[1,2],[1,3],[2,1],[2,2],[2,3],[3,1],[3,2],[3,3]]
        .map { |v1, v2| v1+v2 }           # [2,3,4,3,4,5,4,5,6]
        .uniq - value_set                 # [2,3,4,5,6] - [1,2,3] => [4,5,6]
    end

  end
end
