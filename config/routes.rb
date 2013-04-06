RailJumper::Application.routes.draw do
  root :to => 'pages#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :people

  resources :quizzes do
    collection do
      get 'graph'
    end
  end
  resources :tags, :only => [:create]
  resources :options, :only => [:create]
  resources :exercises, :only => [:create]

end
