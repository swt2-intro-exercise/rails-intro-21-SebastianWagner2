require 'rails_helper'

 describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render withour error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path

     expect(page).to have_field('author[first_name]')
     expect(page).to have_field('author[last_name]')
     expect(page).to have_field('author[homepage]')
   end

   it "should create a new author in the database upon submission" do
    visit new_author_path

    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'

    find('input[type="submit"]').click

    @author = Author.first

    expect(Author.count).to eq(1)
    expect(@author.first_name).to eq("Alan")
    expect(@author.last_name).to eq("Turing")
    expect(@author.homepage).to eq("http://wikipedia.org/Alan_Turing")
  end

  it "should notify the user of errors when author could not be saved" do
    visit new_author_path

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end    
end
 
