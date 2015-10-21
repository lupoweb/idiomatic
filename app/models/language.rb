class Language
	include Mongoid::Document
  has_many :words, dependent: :delete

  field :code, type: String
  field :label, type: String
  field :enabled, type: Boolean, default: false

  index({ code: 1, label: 1 }, { unique: true })
  scope :enabled, -> { where(enabled: true) }
end
