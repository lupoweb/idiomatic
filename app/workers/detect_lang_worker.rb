class DetectLangWorker
  include Sidekiq::Worker
  def perform(text)
    Query.create(body: text)
  end
end