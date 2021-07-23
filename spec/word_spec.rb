require 'simplecov'
SimpleCov.start
require 'rspec'

describe('#Word') do
  
  describe('.all') do
    it('returns an empty array when there are no words')
    expect(Word.all).to(eq([]))
  end
end