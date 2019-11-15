Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  devise_scope :user do
    get 'users/logout', to: 'devise/sessions#destroy'
  end

  use_doorkeeper do
    controllers applications: 'oauth/applications'
  end

  namespace :api do
    namespace :v1 do
      get 'credentials/me'
    end
  end

  root to: 'page#top'
end
