require 'simplecov'
SimpleCov.start
require 'rspec'
require 'word'

describe('#definition') do

  describe('.all') do
    it('returns an empty array when there are no definitions') do
      expect(Definition.all).to(eq([]))
    end
  end

  


end