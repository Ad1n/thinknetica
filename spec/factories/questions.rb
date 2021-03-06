FactoryBot.define do
  sequence :title do |n|
    "My question#{n}"
  end

  factory :question do
    title
    body "MyText"
  end

  factory :invalid_question, class: "Question" do
    title nil
    body nil
  end
end