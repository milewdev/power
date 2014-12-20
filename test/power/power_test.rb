require_relative '../test_helper'


describe 'Power.find(n)' do
  it 'returns a smallest set of multiplications required to raise any number to the nth power' do
    Power.find(1).must_equal [1]
    Power.find(2).must_equal [1,2]
    Power.find(3).must_equal [1,2,3]
    Power.find(4).must_equal [1,2,4]
    Power.find(5).must_equal [1,2,3,5]
    Power.find(9).must_equal [1,2,3,6,9]
    Power.find(15).must_equal [1,2,3,5,10,15]
  end
end


describe 'Power.find_all(n)' do
  it 'returns all smallest sets of multiplications required to raise any number to the nth power' do
    Power.find_all(1).must_equal [[1]]
    Power.find_all(2).must_equal [[1,2]]
    Power.find_all(3).must_equal [[1,2,3]]
    Power.find_all(4).must_equal [[1,2,4]]
    Power.find_all(5).must_equal [[1,2,3,5], [1,2,4,5]]
    Power.find_all(9).must_equal [[1,2,3,6,9], [1,2,4,5,9], [1,2,4,8,9]]
    Power.find_all(15).must_equal [[1,2,3,5,10,15], [1,2,3,6,9,15], [1,2,3,6,12,15], [1,2,4,5,10,15]]
  end
end
