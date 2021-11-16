require 'rails_helper'

describe "Index author page", type: :feature do

  it "should show details of all saved authors in table" do
    @alan = FactoryBot.create :author
    @alan2 = FactoryBot.create :author
    @alan3 = FactoryBot.create :author

    @alan2.first_name = "Alan2"
    @alan3.first_name = "Alan3"

    @alan.save
    @alan2.save
    @alan3.save
    
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("Alan2 Turing")
    expect(page).to have_text("Alan3 Turing")
    expect(page).to have_text("http://wikipedia.org/Alan_Turing")
  end

  it "should contain a link to add a new author" do
    visit authors_path

    expect(page).to have_link 'New', href: new_author_path
  end

end
 
