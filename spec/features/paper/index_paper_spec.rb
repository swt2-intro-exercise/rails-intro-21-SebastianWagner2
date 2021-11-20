require 'rails_helper'

describe "Index paper page", type: :feature do

  it "should show details of all saved papers in table" do
    @paper = FactoryBot.create :paper

    @paper.save
    
    visit papers_path

    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
  end

  it "should contain a link to add a new paper" do
    visit papers_path

    expect(page).to have_link 'New', href: new_paper_path
  end

  it "should delete papers when pressing the dedicated button" do
    @paper = FactoryBot.create :paper
    @paper.save

    paper_count = Paper.count
    
    visit papers_path

    page.find('a', text: 'Destroy').click

    expect(Paper.count).to be(paper_count - 1)
  end

end
 