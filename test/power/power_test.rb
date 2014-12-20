require_relative '../test_helper'

describe 'power' do
  describe 'find(1)' do
    it 'returns [1]' do
      Power.find(1).must_equal [1]
    end
  end

  describe 'find(2)' do
    it 'returns [1, 2]' do
      Power.find(2).must_equal [1, 2]
    end
  end

  describe 'find(3)' do
    it 'returns [1, 2, 3]' do
      Power.find(3).must_equal [1, 2, 3]
    end
  end

  describe 'find(4)' do
    it 'returns [1, 2, 4]' do
      Power.find(4).must_equal [1, 2, 4]
    end
  end

  describe 'find(5)' do
    it 'returns [1, 2, 3, 5]' do
      Power.find(5).must_equal [1, 2, 3, 5]
    end
  end

  describe 'find(9)' do
    it 'returns [1, 2, 3, 6, 9]' do
      Power.find(9).must_equal [1, 2, 3, 6, 9]
    end
  end

  describe 'find(15)' do
    it 'returns [1, 2, 4, 5, 10, 15]' do
      Power.find(15).must_equal [1, 2, 3, 5, 10, 15]
    end
  end
end

describe 'generator' do
  describe 'generate_next_power_sets([1])' do
    it 'returns [[1,2]]' do
      Power.generate_next_power_sets([1]).must_equal [[1,2]]
    end
  end

  describe 'generate_next_power_sets([1,2])' do
    it 'returns [[1,2,3], [1,2,4]]' do
      Power.generate_next_power_sets([1,2]).must_equal [[1,2,3], [1,2,4]]
    end
  end

  describe 'generate_next_power_sets([1,2,4])' do
    it 'returns [[1,2,4,3], [1,2,4,5], [1,2,4,6], [1,2,4,8]]' do
      Power.generate_next_power_sets([1,2,4]).must_equal [[1,2,3,4], [1,2,4,5], [1,2,4,6], [1,2,4,8]]
    end
  end
end


describe 'generator' do
  describe 'generate_all_next_power_sets([[1]])' do
    it 'returns [[1,2]]' do
      Power.generate_all_next_power_sets([[1]]).must_equal [[1,2]]
    end
  end

  describe 'generate_all_next_power_sets([[1], [1]])' do
    it 'returns [[1,2]]' do
      Power.generate_all_next_power_sets([[1], [1]]).must_equal [[1,2]]
    end
  end

  describe 'generate_all_next_power_sets([[1], [1,2]])' do
    it 'returns [[1,2], [1,2,3], [1,2,4]]' do
      Power.generate_all_next_power_sets([[1], [1,2]]).must_equal [[1,2], [1,2,3], [1,2,4]]
    end
  end
end


describe 'generator' do
  describe 'find(1)' do
    it 'returns [1]' do
      Power.find(1).must_equal [1]
    end
  end

  describe 'find(2)' do
    it 'returns [1,2]' do
      Power.find(2).must_equal [1,2]
    end
  end

  describe 'find(3)' do
    it 'returns [1,2,3]' do
      Power.find(3).must_equal [1,2,3]
    end
  end

  describe 'find(4)' do
    it 'returns [1,2,4]' do
      Power.find(4).must_equal [1,2,4]
    end
  end

  describe 'find(5)' do
    it 'returns [1,2,3,5]' do
      Power.find(5).must_equal [1,2,3,5]
    end
  end
end


describe 'generator' do
  describe 'find_all(1)' do
    it 'returns [[1]]' do
      Power.find_all(1).must_equal [[1]]
    end
  end

  describe 'find_all(2)' do
    it 'returns [[1,2]]' do
      Power.find_all(2).must_equal [[1,2]]
    end
  end

  describe 'find_all(3)' do
    it 'returns [[1,2,3]]' do
      Power.find_all(3).must_equal [[1,2,3]]
    end
  end

  describe 'find_all(4)' do
    it 'returns [[1,2,4]]' do
      Power.find_all(4).must_equal [[1,2,4]]
    end
  end

  describe 'find_all(5)' do
    it 'returns [[1,2,3,5], [1,2,4,5]]' do
      Power.find_all(5).must_equal [[1,2,3,5], [1,2,4,5]]
    end
  end

  describe 'find_all(15)' do
    it 'returns [[1,2,3,5,10,15], [1,2,3,6,9,15], [1,2,3,6,12,15], [1,2,4,5,10,15]]' do
      Power.find_all(15).must_equal [[1,2,3,5,10,15], [1,2,3,6,9,15], [1,2,3,6,12,15], [1,2,4,5,10,15]]
    end
  end
end
