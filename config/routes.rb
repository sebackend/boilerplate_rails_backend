Rails.application.routes.draw do
  devise_for :users, skip: :all, controllers: {
                                  registrations: 'registrations',
                                  sessions:      'sessions'
                                 }


  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[index show]

      # Devise on V1 of the API
      devise_scope :user do
        post   '/login'            => 'sessions#create',       as: :user_session
        delete '/logout'           => 'sessions#destroy',      as: :destroy_user_session
        post   '/signup'           => 'registrations#create',  as: :user_registration
        get    '/me'               => 'sessions#my_user',      as: :my_user
        put    '/change_password'  => 'users#update_password', as: :update_password
      end
    end
  end
end
