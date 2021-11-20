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

  it "cannot exist without one of the attributes" do
    @paper.title = ""
    expect(@paper).to_not be_valid
    @paper.title = "Something valid"
    expect(@paper).to be_valid

    @paper.venue = ""
    expect(@paper).not_to be_valid
    @paper.venue = "Something else that is valid"
    expect(@paper).to be_valid

    @paper.year = "hellyeah"
    expect(@paper).to_not be_valid
    @paper.year = 2000
    expect(@paper).to be_valid
  end
end
