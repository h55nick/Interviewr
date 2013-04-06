RailJumper::Application.routes.draw do
  root :to => 'pages#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :people

  post '/quizresults' => 'quizzes#quizresults'
  resources :quizzes do
    member do
      get :test
    end
    collection do
      get 'search'
      get 'filter/:tag_id', :action => :filter, :as => :filter
    end
  end


  resources :tags, :only => [:create]
  resources :options, :only => [:create]
  resources :exercises, :only => [:create]

end
