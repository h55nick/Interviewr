RailJumper::Application.routes.draw do
  root :to => 'pages#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :people do
    member do
      get 'graph'
    end
  end

  post '/quizresults' => 'quizzes#quizresults'
  resources :quizzes do
    member do
      get :test
      post 'purchase'
      get 'graph'
    end

    collection do
      get 'search'
      get 'filter/:tag_id', :action => :filter, :as => :filter
     # get 'graph_all'
    end
  end


  resources :tags, :only => [:create]
  resources :options, :only => [:create]
  resources :exercises, :only => [:create]

end
