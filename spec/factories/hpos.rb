FactoryBot.define do
  factory :hpo do
    sequence(:hpo_id) { |n| "HPO_ID_#{n}" }
    term { 'MyString' }

    frequency
  end
end
