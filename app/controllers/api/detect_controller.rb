require 'detect_lang'

# app/controllers/api/detect_controller.rb
class Api::DetectController < Api::BaseController
  def index
  	DetectLangWorker.perform_async(params[:text])
  	render status: 200, json: { languages: DetectLang.new.detect(params[:text]) }
  end
end
