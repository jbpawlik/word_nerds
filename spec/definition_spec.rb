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

  describe('#save') do
    it('saves a definition') do
      definition = Definition.new({:meaning => 'porridge', :id => nil})
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end

  

end