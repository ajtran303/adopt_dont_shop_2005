require "rails_helper"

describe "The Welcome Page" do
  describe "When I visit the home page" do
    it "has links to a Pets and Shelter indices" do
      visit "/"

      expect(page).to have_link("Shelter Index", "/shelters")
      expect(page).to have_link("Pets Index", "/pets")
    end
  end
end
