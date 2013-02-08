Wastenot::Application.routes.draw do
  root :to => "things#index"
  
  resources :things do
    post :gone
  end

  match 'location' => 'locations#find'
end
