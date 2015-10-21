class Api::BaseController < ApplicationController
	skip_before_filter :verify_authenticity_token
  before_filter :check_params
	before_filter :set_headers

	def me
    render status: :ok, json: {}
	end

	def options
	  set_headers
	  # this will send an empty request to the client with 200 status code (OK, can proceed)
	  render :text => '', :content_type => 'text/plain'
	end

  protected

  def check_params
    if params[:text].blank?
      render status: 403, json: { message: 'Missing required text param' }
      return false
    end
    return true
  end

	# Set CORS
  def set_headers
    headers["Access-Control-Allow-Origin"] = '*'
    headers['Access-Control-Expose-Headers'] = 'Etag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-Modified-Since, If-None-Match, Authorization'
    headers['Access-Control-Max-Age'] = '86400'
  end
end
