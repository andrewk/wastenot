Wastenot::Application.routes.draw do
  root :to => "home#show"
  
  resources :things do
    post :gone
  end

  match 'location' => 'locations#find'
end
