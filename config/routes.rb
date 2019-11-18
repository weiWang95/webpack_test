Rails.application.routes.draw do
  scope "(:locale)", locale: /en|zh-CN/ do
    resources :users, only: [:index]
    resources :inns, only: [:show]

    namespace :admins do
      get '/', to: 'dashboards#show'
      resource :inn, only: [:show, :edit, :update]
      resource :dashboard, only: [:show]
      resources :rooms, except: [:show]
    end

    root 'home#show'
  end
end
