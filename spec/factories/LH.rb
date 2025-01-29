FactoryBot.define do
  factory :learning_history do
    title { "test" }
    content { Faker::Lorem.paragraph(sentence_count: 5) }
    hour { Faker::Number.between(from: 1, to: 10) }

    association :user

    after(:build) do |learning_history|
      learning_history.quiz = build(:quiz, learning_history: learning_history, user: learning_history.user)
    end
  end

  factory :quiz do
    title { Faker::Lorem.sentence(word_count: 3) }
    content { Faker::Lorem.paragraph(sentence_count: 5) }
    sample_answer { Faker::Lorem.paragraph(sentence_count: 2) }
    association :learning_history
    association :user
  end
end
