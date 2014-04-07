BusSchedule::Application.routes.draw do
  root to: "lines#index"
  resources :stations,  :except => [:new, :edit]
  resources :lines,  :except => [:new, :edit]
end
