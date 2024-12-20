FactoryBot.define do
  factory :article_form do
    theme    {Faker::Lorem.word}
    issue    {Faker::Lorem.sentence}
    measure  {Faker::Lorem.sentence}
    result   {Faker::Lorem.sentence}
    tag_name {Faker::Lorem.word}
    user_id  {1}
    
    after(:build) do |article_form|
      article_form.image = {io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg'}
    end
  end
end
