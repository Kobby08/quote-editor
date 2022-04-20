Rails.application.routes.draw do
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: %i[index show] do
      resources :line_items, except: %i[index show]
    end
  end
  root 'pages#home'
end
