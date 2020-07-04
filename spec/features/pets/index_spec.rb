require "rails_helper"

describe "Pet Index Spec" do
  describe "As a visitor to '/pets'" do
    it "I can see each Pet's image, name, approx. age, sex, and shelter name" do
      placeholder_image = "webfx.com/blog/images/cdn.designinstruct.com/files/582-how-to-image-placeholders/generic-image-placeholder.png"

      doggo_house = Shelter.create(name: "Doggo House", address: "1323 Paper St", city: "Denver", state: "CO", zip: "000000")
      catto_house = Shelter.create(name: "Catto House", address: "2124 N. Pencil Ave", city: "Denver", state: "CO", zip: "000000")

      doggo = Pet.create(image: placeholder_image, name: "Doggo", approximate_age: 3, sex: "M", shelter: doggo_house)
      catto = Pet.create(image: placeholder_image, name: "Catto", approximate_age: 7, sex: "F", shelter: catto_house)

      visit "/pets"

      doggo_image = find("#doggo-image")
      expect(doggo_image[:src]).to eq(placeholder_image)
      expect(doggo_image[:src]).to eq("Doggo, the adoptable dog")

      expect(page).to have_text(doggo.name)
      expect(page).to have_text(doggo.approximate_age)
      expect(page).to have_text(doggo.sex)
      expect(page).to have_text(doggo_house.name)

      catto_image = find("#catto-image")
      expect(catto_image[:src]).to eq(placeholder_image)
      expect(catto_image[:src]).to eq("Catto, the adoptable cat")

      expect(page).to have_text(catto.name)
      expect(page).to have_text(catto.approximate_age)
      expect(page).to have_text(catto.sex)
      expect(page).to have_text(catto_house.name)

    end
  end
end
