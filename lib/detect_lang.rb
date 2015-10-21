class DetectLang

	def detect(text)
		words = text.split(/\W+/)
		langs = words.map { |word| fetch(word, Language.enabled.map(&:id)) }
		langs.flatten.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}.sort_by {|k, v| v}.reverse.to_h
	end

  private

  def fetch(word, languages)
  	threads = []
  	langs = []
  	languages.each do |langid|
  		threads << Thread.new {
  			langs << search(word, langid)
  		}
  	end
  	threads.each(&:join)
		langs 
	end

	def search(word, langid)
		Word.where(language_id: langid).where(label: word).flat_map(&:language).flat_map(&:code)
	end
end