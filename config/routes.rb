Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :questions

resources :questions do
    resources :users do
        put "like", to: "questions#upvote"
        put "dislike", to: "questions#downvote"
        put "unvote", to: "questions#unvote"
    end
end

resources :answers do
    resources :users do
        put "like", to: "answers#upvote"
        put "dislike", to: "answers#downvote"
        put "unvote", to: "answers#unvote"
    end
end

resources :users

resources :acomments

resources :qcomments

  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
