require 'simplecov'
SimpleCov.start
require 'rspec'
require 'word'

describe('#word') do

  before(:each) do
    Word.clear
  end

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

  describe('.all') do
    it('returns saved Words') do
      word = Word.new({:name => 'reff', :id => nil})
      word.save
      word2 = Word.new({:name => 'alis', :id => nil})
      word2.save
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it('refers to the same word if it has the same attributes as another word') do
      word = Word.new({:name => 'reff', :id => nil})
      word.save
      expect(Word.all).to(eq([word]))
      word2 = Word.new({:name => 'reff', :id => nil})
      word2.save
      expect(word).to(eq(word2))
    end
  end


end