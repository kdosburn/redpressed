require 'spec_helper'

describe "StaticPages" do

  subject { page }
	
	describe "Home page" do
    subject { page }
    before { visit root_path }
		#simply indicating that we are describing the home page

    it { should have_content('Home') }
    it { should have_title('KO | Home') }
    it { should_not have_title('Pippin') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
    # it "should have the content 'Home'" do
    # 	#this (above) is the spec
    #   # visit root_path <-- this is commented out because of the before filter
    #   #visit is a Capybara method simulating a browser visiting this url
    #   expect(page).to have_content('Home')
    #   #page is another Capybara variable -- it holds the resulting page from the 'visit'
    # end

    # it "should have the title 'Home'" do
    #   expect(page).to have_title('KO | Home')
    # end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title('KO | Help')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit about_path
      expect(page).to have_title('KO | About')
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "shoud have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title('KO | Contact')
    end
  end
end
