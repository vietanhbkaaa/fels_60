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
  task create_options: :environment do
    words = Word.all
    5.times do
      content = Faker::Lorem.word
      words.each { |word| word.options.create!(content: content )}
    end
    correct_option = Faker::Lorem.word
    words.each { |word| word.options.create!(content: correct_option, correct: true )}
  end
end