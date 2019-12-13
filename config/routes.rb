Rails.application.routes.draw do

  
  mount Flipflop::Engine => "/flipflop"

  
  devise_for :users, controllers: { registrations: "users/registrations"}

  devise_scope :user do 
    get "/users/:id/edit_admin" => "users/registrations#edit_admin"
    get "/user/create_user" => "users/registrations#create_user"
    post "/user/create_user" => "users/registrations#create_user_master"
    patch "/users/edit_admin" => "users/registrations#update_admin"
    put "/users/edit_admin" => "users/registrations#update_admin"
    delete "/user/admin" => "users/registrations#delete_user"

  end 

  # scope '/api' do
  #   resources :groups, except: [:new, :edit]
  #   resources :articles
  # end

  mount Flipper::UI.app(Flipper) => '/flipper'




  get 'subscriptions/index'
  get 'welcome/index'

  resources :articles

  resources :authors

  resources :products

  resources :categories

  resources :subscribers

  resources :magazines

  resources :movies do
    resources :comments, module: :movies
  end

  resources :actors do
    resources :comments, module: :actors
  end

  namespace :api do
    namespace :v1 do
      #post 'articles', to: 'articles#showcols'

      resources :articles do
        resources :author
      end

      resources :authors do
        resources :article
      end
    end
  end

  get '/categorization', to: 'categorization#index'

  get '/categorization/:id', to: 'categorization#show'

  get '/subscriptions', to: 'subscriptions#index'

  get '/users', to: 'users#index'

  get '/users/:id', to: 'users#show', as: 'users_show'

  get '/users/:id/edit_admin', to: 'users/registrations#edit_admin', as: 'edit_user'

  get '/user/create_user', to: 'users/registrations#create_user', as: 'create_user'

  delete '/user/admin', to: 'users/registrations#delete_user', as: 'delete_user'

  post '/user/demo/sql_injection', to: 'users#demo_sql_injection', as: 'demo_sql_injection'



  root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #
  #
  #
  # API
  #
  get 'api/status', controller: 'application', action: 'status'
end
