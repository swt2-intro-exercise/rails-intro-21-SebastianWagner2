require 'rails_helper'

 describe "New author page", type: :feature do
   it "should exist at 'new_paper_path' and render withour error" do
     visit new_paper_path

     expect(page).to have_field('paper[title]')
     expect(page).to have_field('paper[venue]')
     expect(page).to have_field('paper[year]')
   end

   it "should create a new author in the database upon submission" do
    visit new_paper_path

    page.fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    page.fill_in 'paper[venue]', with: 'Mind 49: 433-460'
    page.fill_in 'paper[year]', with: 1950

    find('input[type="submit"]').click

    @paper = Paper.first

    expect(Paper.count).to eq(1)
    expect(@paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(@paper.venue).to eq('Mind 49: 433-460')
    expect(@paper.year).to eq(1950)
  end

  #it "should notify the user of errors when author could not be saved" do
  #  visit new_paper_path
  #
  #  find('input[type="submit"]').click
  #
  #  expect(page).to have_text('error')
  #end    
end
 
