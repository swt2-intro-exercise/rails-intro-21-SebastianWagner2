require 'rails_helper'

RSpec.describe Author, type: :model do
  before do
    @author = Author.new()

    @author.first_name = "Basti"
    @author.last_name = "Wagner"
    @author.homepage = "https://www.theraleighregister.com/basti-wagner-homepage.html"
  end

  it "allows to modify an author object" do
    expect(@author.first_name).to eq("Basti")
    expect(@author.last_name).to eq("Wagner")
    expect(@author.homepage).to eq("https://www.theraleighregister.com/basti-wagner-homepage.html")
  end
  
  it "gerenates the correct full name" do
    expect(@author.name).to eq("Basti Wagner")
  end

  it "cannot exist without a last name" do
    @author.last_name = ""
    expect(@author).to_not be_valid
  end
end
