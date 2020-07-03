require "rails_helper.rb"

describe "Visiting '/shelters/:id'" do
  it "displays that shelter's name, address, city, state, and zip" do
    shelter1 = Shelter.create(name: "Doggo House", address: "1323 Paper St", city: "Denver", state: "CO", zip: "000000")

    visit "/shelters/1"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
  end
end
