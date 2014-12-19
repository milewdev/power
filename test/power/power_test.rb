require_relative '../test_helper'

describe 'power' do
  describe '1' do
    it 'returns [1]' do
      Power.find(1).must_equal [1]
    end
  end
end
