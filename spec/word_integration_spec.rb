require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('create a word path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      visit('/words')
      click_on('Add a new word')
      fill_in('word_name', :with => 'Cat')
      click_on('ENTER')
      expect(page).to have_content('Cat')
    end
  end

  describe('create a word path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      word = Word.new("Cat", nil)
      word.save()
      visit("/words/#{word.id}")
      fill_in('definition_name', :with => 'furry animal')
      click_on('ENTER')
      expect(page).to have_content('furry animal')
    end
  end

  describe('describe update a word path', {:type => :feature}) do
    it('update a word') do
      word = Word.new("Cat", nil)
      word.save()
      visit("/words/#{word.id}")
      fill_in('definition_name', :with => 'furry animal')
      click_on('ENTER')
      click_on('Edit word')
      fill_in('name', :with => 'Cat')
      click_on('Update')
      expect(page).to have_content('Cat')
    end
  end

  describe('describe delete a word path', {:type => :feature}) do
    it('deletes a word') do
      word = Word.new("Cat", nil)
      word.save()
      visit("/words/#{word.id}")
      fill_in('definition_name', :with => 'furry animal')
      click_on('ENTER')
      click_on('Edit word')
      click_on('Delete word')
      save_and_open_page
      expect(page).not_to have_content('Cat')
    end
  end

end
