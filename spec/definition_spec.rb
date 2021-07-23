require 'simplecov'
SimpleCov.start
require 'rspec'
require 'word'

describe('#definition') do

  before(:each) do
    Definition.clear
  end

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

  describe('.all') do
    it('returns saved definitions') do
      definition = Definition.new({:meaning => 'porridge', :id => nil})
      definition.save
      definition2 = Definition.new({:meaning => 'rainbow', :id => nil})
      definition2.save
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

end