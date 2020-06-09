Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions:'users/sessions'
   }

  devise_scope :user do
    get "users/select_registration", to: 'users/registrations#select', as: :select_registration
    get "users/confirm_phone", to: 'users/registrations#confirm_phone', as: :confirm_phone
    get "users/new_address", to: 'users/registrations#new_address', as: :new_regist_address
    post "users/regist_address", to: 'users/registrations#create_address', as: :regist_address
    get "users/new_payment", to: 'users/registrations#new_payment', as: :new_regist_payment
    get "users/regist_completed", to: 'users/registrations#completed', as: :regist_completed
  end

  resources :cards
  resources :item
 
 
 
end
