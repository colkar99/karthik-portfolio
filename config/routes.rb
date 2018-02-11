Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id',to: 'portfolios#show', as: 'portfolio_show'
  # get 'pages/home'
  get 'about-me',to: 'pages#about'
  get 'contact',to: 'pages#contact'
  root to: 'pages#home'
  resources :blogs do
  	member do |variable|
  		get :toggle_status
  	end
  end

  # get 'query/:else', to: 'pages#somethigdo'
  # get 'post/*missing', to: 'controller#action' => anything after post will redirect to specific page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
