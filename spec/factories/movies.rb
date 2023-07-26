FactoryBot.define do
  factory :movie do
    title { "Sample Movie" }
    plot { "This is a sample movie description." }
    release_year { 2023 }
  end
end
