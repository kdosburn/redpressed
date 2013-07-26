require 'spec_helper'

describe "StaticPages" do
	
	describe "Home page" do
		#simply indicating that we are describing the home page

    it "should have the content 'Sample App'" do
    	#this (above) is the spec
      visit '/static_pages/home'
      #visit is a Capybara method simulating a browser visiting this url
      expect(page).to have_content('Sample App')
      #page is another Capybara variable -- it holds the resulting page from the 'visit'
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("KO | Home")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('KO | Help')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title('KO | About')
    end
  end
end
