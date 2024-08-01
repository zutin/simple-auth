Rails.application.routes.draw do
  mount_devise_token_auth_for 'Employee', at: 'auth', skip: [:registrations, :sessions]

  as :employee do
    post 'auth/sign_in' => 'devise_token_auth/sessions#create'
    delete 'auth/sign_out' => 'devise_token_auth/sessions#destroy'
    post 'auth/sign_up' => 'devise_token_auth/registrations#create'
  end

  resources :employees, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check
end
