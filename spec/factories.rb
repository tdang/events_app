FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :event do
    name "Kizomba"
    location "Dancey Ballroom"
    start_date Date.new
    end_date Date.new
    price "10"
    content "Lorem ipsum"
    user
  end
end