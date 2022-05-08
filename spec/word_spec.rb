require 'rspec'
require 'word'
require 'definition'

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Hat", nil)
      word.save()
      word2 = Word.new("Cat", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("Hat", nil)
      word2 = Word.new("Hat", nil)
      expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("Hat", nil)
      word.save()
      word2 = Word.new("Cat", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("Hat", nil)
      word.save()
      word2 = Word.new("Cat", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("Hat", nil)
      word.save()
      word.update("Cat")
      expect(word.name).to(eq("Cat"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word = Word.new("Hat", nil)
      word.save()
      word2 = Word.new("Cat", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definition") do
      word = Word.new("Cat", nil)
      word.save()
      definition = Definition.new("animal", word.id, nil)
      definition.save()
      definition2 = Definition.new("reptile", word.id, nil)
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end

end