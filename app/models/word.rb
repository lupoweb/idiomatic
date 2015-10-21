class Word
	include Mongoid::Document
  belongs_to :language, index: true

  field :label, type: String
  field :score, type: Float
  index({ language_id: 1, label: 1 }, { unique: true })
end
