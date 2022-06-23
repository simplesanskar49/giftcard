Rails.application.routes.draw do
  # Add a root route if you don't have one...
  # We can use users#new for now, or replace this with the controller and action you want to be the site root:
  # root to: 'sessions#new'
  root to: 'users#new'
  # sign up page with form:
  get 'users/new' => 'users#new', as: :new_user

  # create (post) action for when sign up form is submitted:
  post 'users' => 'users#create'

  # log in page with form:
  get '/login' => 'sessions#new'

  # create (post) action for when log in form is submitted:
  post '/login' => 'sessions#create'

  # delete action to log out:
  delete '/logout' => 'sessions#destroy'

  get '/logout' => 'sessions#destroy'

  get 'admin/history' => 'admin#history'

  get 'admin/report' => 'admin#report'

  get 'orders/home'

  get 'orders/history'

  post 'orders' => 'orders#create'

  get 'orders/:id' => 'orders#show'

  get '/orders/:id/edit' => 'orders#edit'

  patch '/orders/:id' => 'orders#update'

  put '/orders/:id' => 'orders#update'

  post '/orders/:id' => 'orders#update'

  put '/orders/:id/edit' => 'orders#update'

  post '/orders/:id/edit' => 'orders#update'

end