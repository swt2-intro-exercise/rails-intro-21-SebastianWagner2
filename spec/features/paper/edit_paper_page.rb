require 'rails_helper'

describe "Edit paper page", type: :feature do
  before do
    @paper = FactoryBot.create :paper
    @paper.save
  end

  it "should load without an error and display the right information" do
    visit edit_paper_path(@paper)

    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end

  it "should save given changes to a paper" do
    visit edit_paper_path(@paper)

    page.fill_in 'paper[title]', with: 'Example'
    page.fill_in 'paper[venue]', with: 'example'
    page.fill_in 'paper[year]', with: 1950

    find('input[type="submit"]').click
    @paper.reload

    expect(@paper.title).to eq('Example')
    expect(@paper.venue).to eq('example')
    expect(@paper.year).to eq(1950)
end

  it "should notify the user of errors when paper could not be saved" do
    visit edit_paper_path(@paper)

    page.fill_in 'paper[title]', with: ''

    find('input[type="submit"]').click

    expect(page).to have_text('error')
  end
end