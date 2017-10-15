Rails.application.routes.draw do
  get 'group/index'

  get 'score/generate_score'

  get 'score/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
