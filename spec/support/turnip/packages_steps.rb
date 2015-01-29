module Turnip
  module PackagesSteps
    step "I'm in the root page" do
      visit root_path
    end

    step "there are some packages" do
      within "ul" do
        expect(page).to have_content "Redis"
        expect(page).to have_content "A3"
      end
    end

    step "I search for a package" do
      fill_in "search", with: "Redis"
      click_button "Search"
    end

    step "I should see if the package exists" do
      expect(page).to have_css("ul li", count: 1)

      within "ul" do
        expect(page).to have_content "Redis"
        expect(page).to have_content "2.4.1"
        expect(page).to have_content "Redis key-value cache store"
      end
    end
  end
end

RSpec.configure do |c|
  c.include Turnip::PackagesSteps
end
