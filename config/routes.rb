Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
  use_doorkeeper do
    controllers applications: 'oauth/applications'
  end

  root to: 'page#top'
end
