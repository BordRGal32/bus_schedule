BusSchedule::Application.routes.draw do
  root to: "stations#index"
  resources :stations,  :except => [:new]
end
