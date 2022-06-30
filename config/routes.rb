Rails.application.routes.draw do
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
        
      end
      get :posts_with_max_comments, to: 'posts#posts_with_max_comments'
      get :user_posts, to: 'posts#user_posts'
      get :most_commented_users, to: 'comments#most_commented_users'
      post '/:comment_id/reply_to_comment', to: 'comments#reply_to_comment'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
