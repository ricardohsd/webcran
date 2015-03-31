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
        expect(page).to have_content "Dependencies:"
        expect(page).to have_link "R (>= 2.14)"
        expect(page).to have_link "methods"
        expect(page).to have_link "A3"
      end
    end

    step "I click in a package dependency that exists" do
      click_link 'A3'
    end

    step "I should see the dependent package page" do
      expect(page).to have_content "A3"
      expect(page).to have_css("ul li", count: 1)


      within "ul" do
        expect(page).to have_content "0.9.2"
        expect(page).to have_content "A3: Accurate, Adaptable, and Accessible Error Metrics for Predictive Models"
      end
    end

    step "I click in a unexistent package dependency" do
      click_link "methods"
    end

    step "I should see a alert about the unexistent package" do
      expect(page).to have_content "Couldn't find the package 'methods'."
    end
  end
end

RSpec.configure do |c|
  c.include Turnip::PackagesSteps
end
