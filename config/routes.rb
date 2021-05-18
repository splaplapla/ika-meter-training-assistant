Rails.application.routes.draw do
  root to: "top#index"
  resources :datasets do
    resources :dataset_positions, only: :create
  end
end
