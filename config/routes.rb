Sierra::Application.routes.draw do
  scope ENV['RAILS_RELATIVE_URL_ROOT'] || '/' do
    resources :users do
      member do
        post 'compare/' => 'users#compare', as: :compare
      end
    end
    get 'export_users_search_list/' => 'users#export_users_search_list', as: :export_users_search_list

    resources :roles do
      member do
        get 'export_users/' => 'roles#export_users_in_role', as: :export_users_in
      end
    end
   
    get "password_change_audit" => 'reports#password_change_audit'

    root 'users#index'

    
  end
end