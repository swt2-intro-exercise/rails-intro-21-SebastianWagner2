require 'rails_helper'

RSpec.describe Paper, type: :model do
  before do
    @paper = Paper.new()

    @paper.title = "COMPUTING MACHINERY AND INTELLIGENCE"
    @paper.venue = "Mind 49: 433-460"
    @paper.year = 1950
  end

  it "allows to modify an author object" do
    expect(@paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(@paper.venue).to eq("Mind 49: 433-460")
    expect(@paper.year).to eq(1950)
  end

  #it "cannot exist without a last name" do
  #  @author.last_name = ""
  #  expect(@author).to_not be_valid
  #end
end
