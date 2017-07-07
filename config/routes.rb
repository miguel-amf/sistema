Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :cursos do
    collection do

      post :atualizaTxt
    end
  end
  resources :disciplinas
  resources :fluxos
  
  resources :alunos, except: [:index] do
    resources :resultados
  end

  get '/login' => 'sessions#new'
  get '/' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  
end
