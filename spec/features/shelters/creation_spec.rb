require "rails_helper.rb"

describe "New Shelter Creation Spec" do
  it "Create a new shelter" do
    visit "/shelters"
    click_link "New Shelter"
    expect(page.current_path).to eql "/shelters/new"
  end
end
