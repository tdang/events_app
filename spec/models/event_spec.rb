require 'spec_helper'

describe Event do
  let(:user) { FactoryGirl.create(:user) }
  before { @event = user.events.build(content: "Lorem ipsum", name: "Kizomba", location: "Dancey Ballroom", start_date: Date.new, end_date: Date.new, price: "10") }

  subject { @event }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }

  it { should respond_to(:name) }
  it { should respond_to(:location) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:price) }



  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @event.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with blank content" do
  	before { @event.content = " " }
  	it { should_not be_valid }
  end

  describe "with blank name" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "with blank location" do
    before { @event.location = " " }
    it { should_not be_valid }
  end

  describe "with blank start date" do
    before { @event.start_date = " " }
    it { should_not be_valid }
  end

  describe "with blank end date" do
    before { @event.end_date = " " }
    it { should_not be_valid }
  end

  describe "with blank price" do
    before { @event.price = " " }
    it { should_not be_valid }
  end
end
