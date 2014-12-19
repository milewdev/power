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
