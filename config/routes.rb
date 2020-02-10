Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions:'users/sessions'
   }

  devise_scope :user do
    get "users/select_registration", to: 'users/registrations#select', as: :select_registration
    get "users/confirm_phone", to: 'users/registrations#confirm_phone', as: :confirm_phone
    get "users/new_address", to: 'users/registrations#new_address', as: :new_regist_address
  end

 
 
 
end
