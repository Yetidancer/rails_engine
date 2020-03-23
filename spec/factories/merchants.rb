FactoryBot.define do
  factory :merchant do
    name { Faker::TvShows::Simpsons.character  }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
