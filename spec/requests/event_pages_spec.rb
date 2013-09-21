require 'spec_helper'

describe "EventPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "event creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create an event" do
        expect { click_button "Create" }.not_to change(Event, :count)
      end

      describe "error messages" do
        before { click_button "Create" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in "Add a new event...",      with: "Lorem"
        fill_in "Name:",         with: "Example User"
        fill_in "Location:",        with: "user@example.com"
        fill_in "Price:",     with: "12"
        fill_in "Starting:", with: "010101"
        fill_in "Ending:", with: "010101"
      end

      it "should create a event" do
        expect { click_button "Create" }.to change(Event, :count).by(1)
      end
    end
  end
end
