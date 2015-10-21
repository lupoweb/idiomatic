Rails.application.routes.draw do
  namespace :api  do
  	get 'detect' => 'detect#index'
  end
end
