require 'rails_helper'

describe "Edit author page", type: :feature do
  before do
    @alan = FactoryBot.create :author    
    @alan.save
  end

  it "should load without an error and display the right information" do
    visit edit_author_path(@alan)

    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save given changes to an author" do
    visit edit_author_path(@alan)

    page.fill_in 'author[first_name]', with: 'Alan2'
    page.fill_in 'author[last_name]', with: 'Turing2'
    page.fill_in 'author[homepage]', with: ''

    find('input[type="submit"]').click
    @alan.reload

    expect(@alan.first_name).to eq('Alan2')
    expect(@alan.last_name).to eq('Turing2')
    expect(@alan.homepage).to eq('')
end

  it "should notify the user of errors when author could not be saved" do
    visit edit_author_path(@alan)

    page.fill_in 'author[last_name]', with: ''

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end
end