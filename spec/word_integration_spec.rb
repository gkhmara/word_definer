require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

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
