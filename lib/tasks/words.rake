namespace :words do
  desc "import words from language file"
  task create: :environment do

    language = Language.find_by(code: 'it')
    File.foreach('words/it.txt') do |word|
      next if word.blank?
      Word.create(language: language.id, label: word.strip, score: word.strip.length.to_f)
    end
    language.update_attributes(enabled: true)

    language = Language.find_by(code: 'en')
    File.foreach('words/en.txt') do |word|
      next if word.blank?
      Word.create(language: language.id, label: word.strip, score: word.strip.length.to_f)
    end
    language.update_attributes(enabled: true)

    language = Language.find_by(code: 'es')
    File.foreach('words/es.txt') do |word|
      next if word.blank?
      Word.create(language: language.id, label: word.strip, score: word.strip.length.to_f)
    end
    language.update_attributes(enabled: true)
  end
end
