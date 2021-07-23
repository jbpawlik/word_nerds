require 'simplecov'
SimpleCov.start
require 'rspec'
require 'word'

describe('#word') do
  
  describe('.all') do
    it('returns an empty array when there are no words') do
    expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word') do
      word = Word.new({:name => 'reff', :id => nil})
      word.save
      expect(Word.all).to(eq([word]))
    end
  end


  # describe('#save') do
  #   it('saves a word') do
  #     word = Word.new({:name => 'reff', :id => nil})
  #     word.save
  #     expect(Word.all).to(eq([word]))
  #     word2 = Word.new({:name => 'alis', :id => nil})
  #     word2.save
  #     expect(Word.all).to(eq([word]))
  #   end
  # end


end