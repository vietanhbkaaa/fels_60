namespace :create_words do

  desc "TODO"
  task create_words: :environment do
    courses = Course.all
    courses.each do |course|
      20.times do
        content = Faker::Lorem.word
        course.words.create!(content: content)
      end
    end
  end

  desc "TODO"
  task create_options: :environment do
    words = Word.all
    3.times do
      content = Faker::Lorem.word
      words.each { |word| word.options.create!(content: content )}
    end
    correct_option = Faker::Lorem.word
    words.each { |word| word.options.create!(content: correct_option, correct: true )}
  end
end