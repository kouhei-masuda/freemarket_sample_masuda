Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations:'users/registrations',
    sessions:'users/sessions'
   }

  devise_scope :user do
    get "users/select_registration", to: 'users/registration#select', as: :select_registration
  end

 
 
 
end
