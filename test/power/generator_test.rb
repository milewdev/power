require_relative '../test_helper'

describe 'generator' do
  describe 'generate([1])' do
    it 'returns [[1,2]]' do
      Generator.generate([1]).must_equal [[1,2]]
    end
  end

  describe 'generate([1,2])' do
    it 'returns [[1,2,3], [1,2,4]]' do
      Generator.generate([1,2]).must_equal [[1,2,3], [1,2,4]]
    end
  end

  describe 'generate([1,2,4])' do
    it 'returns [[1,2,4,3], [1,2,4,5], [1,2,4,6], [1,2,4,8]]' do
      Generator.generate([1,2,4]).must_equal [[1,2,3,4], [1,2,4,5], [1,2,4,6], [1,2,4,8]]
    end
  end
end


describe 'generator' do
  describe 'generate_all([[1]])' do
    it 'returns [[1,2]]' do
      Generator.generate_all([[1]]).must_equal [[1,2]]
    end
  end

  describe 'generate_all([[1], [1]])' do
    it 'returns [[1,2]]' do
      Generator.generate_all([[1], [1]]).must_equal [[1,2]]
    end
  end

  describe 'generate_all([[1], [1,2]])' do
    it 'returns [[1,2], [1,2,3], [1,2,4]]' do
      Generator.generate_all([[1], [1,2]]).must_equal [[1,2], [1,2,3], [1,2,4]]
    end
  end
end


describe 'generator' do
  describe 'find(1)' do
    it 'returns [1]' do
      Generator.find(1).must_equal [1]
    end
  end

  describe 'find(2)' do
    it 'returns [1,2]' do
      Generator.find(2).must_equal [1,2]
    end
  end

  describe 'find(3)' do
    it 'returns [1,2,3]' do
      Generator.find(3).must_equal [1,2,3]
    end
  end

  describe 'find(4)' do
    it 'returns [1,2,4]' do
      Generator.find(4).must_equal [1,2,4]
    end
  end

  describe 'find(5)' do
    it 'returns [1,2,3,5]' do
      Generator.find(5).must_equal [1,2,3,5]
    end
  end
end
