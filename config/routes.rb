Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  get '/', to: 'home#index'

  devise_for :users
  resources :receipts do
    resources :comments
  end
  resources :my_receipts
  resources :home, only: [:index]
  resources :articles
  resources :categories
  resources :receipt_categories

  namespace :admin do
    resources :users, only: [:index, :update] do
      member do
        post :ban
        post :unban
      end
    end
    resources :users, only: [:index]
    resources :articles
    resources :categories
    resources :receipts
  end

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    get '/', to: 'home#index'
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  get '', to: redirect("/#{I18n.default_locale}/receipts")

end
