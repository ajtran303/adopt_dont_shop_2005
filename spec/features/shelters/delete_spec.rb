require "rails_helper"

describe "Shelter Delete Spec" do
  describe "As a visitor" do
    describe "When I visit a shelter show page" do
      it "" do
        liono_house = Shelter.create(name: "Liono House", address: "6126 Library Blvd", city: "Denver", state: "CO", zip: "000000")
        id = liono_house.id
        visit "/shelters/#{id}"

        click_link "Delete Shelter"
        expect(current_path).to eq("/shelters")

        expect(page).to have_no_text("Liono House")
      end
    end
  end
# and I am redirected to the shelter index page where I no longer see this shelter

end
