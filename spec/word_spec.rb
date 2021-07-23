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
    it('allows two words to have the same attributes') do
      word = Word.new({:name => 'reff', :id => nil})
      word.save
      word2 = Word.new({:name => 'reff', :id => nil})
      word2.save
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it('will clear all saved words') do
      word = Word.new({:name => 'reff', :id => nil})
      word.save
      word2 = Word.new({:name => 'alis', :id => nil})
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("will find a word by its id") do
      word = Word.new({:name => "reff", :id => nil})
      word.save
      word2 = Word.new({:name => "alis", :id => nil})
      word2.save
      expect(Word.find(word2.id)).to(eq(word2))
    end
  end

  describe('#update') do
    it('will update a word') do
      word = Word.new({:name => "reff", :id => nil})
      word.save
      word.update({:name => "alis"})
      expect(word.name).to(eq({:name=> "alis"}))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new({:name => "reff", :id => nil})
      word.save
      word2 = Word.new({:name => "alis", :id => nil})
      word2.save
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end



end