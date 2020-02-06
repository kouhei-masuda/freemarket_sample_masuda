Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get "users/select_registration", to: 'users/registration#select', as: :select_registration
  end
end
