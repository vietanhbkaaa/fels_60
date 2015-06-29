namespace :create_words do

  desc "TODO"
  task create_words: :environment do
    courses = Course.all
    20.times do |n|
      courses.each do |course|
        4.times do
          content = Faker::Lorem.word
          course.words.create!(content: content, lesson_id: n)
        end
      end
    end
  end

  desc "TODO"
  task create_answers: :environment do
    words = Word.all
    5.times do
      content = Faker::Lorem.word
      words.each { |word| word.answers.create!(content: content )}
    end
    answer = Faker::Lorem.word
    words.each { |word| word.answers.create!(content: answer, correct: true )}
  end
end
