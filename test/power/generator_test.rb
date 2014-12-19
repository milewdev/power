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
