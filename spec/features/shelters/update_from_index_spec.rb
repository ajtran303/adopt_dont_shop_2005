require "rails_helper"

describe "Shelter Update From Shelter Index Spec" do
  describe "As a visitor" do
    describe "When I visit the shelter index page" do
      before(:each) do
        @shelter1 = Shelter.create(
          name: "Doggo House",
          address: "1323 Paper St",
          city: "Denver",
          state: "CO",
          zip: "000000"
        )

        @shelter2 = Shelter.create(
          name: "Catto House",
          address: "2124 N. Pencil Ave",
          city: "Denver",
          state: "CO",
          zip: "000000"
        )

        @shelter3 = Shelter.create(
          name: "Lizzo House",
          address: "5125 E. Book Cir",
          city: "Denver",
          state: "CO",
          zip: "000000"
        )

        @shelter4 = Shelter.create(
          name: "Liono House",
          address: "6126 Library Blvd",
          city: "Denver",
          state: "CO",
          zip: "000000"
        )

        @shelters = Shelter.all
      end

      it "I can update any shelter's information" do
        visit "/shelters"
        @shelters.each do |shelter|
          expect(page).to have_text(shelter.name)
          
          update_link = "/shelters/#{shelter.id}/edit"
          expect(page).to have_link("Update Shelter", href: update_link)
        end
      end
    end
  end
end
