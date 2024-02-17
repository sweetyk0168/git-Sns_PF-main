Rails.application.routes.draw do
  namespace :public do
    get 'notifications/index'
    get "search" => "searches#search"
  end

  #管理者用
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #ユーザー用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # root 'public/homes#top'
  get '/customers/information/edit' => 'public/customers#edit'
  patch '/customers/information' => 'public/customers#update'
  get 'customers/confirm_withdraw' => 'public/customers#confirm_withdraw'
  patch 'customers/confirm_withdraw' => 'public/customers#withdraw'
  # get '/admin/event_questionnaires_answers/index' => '/admin/event_questionnaires_answers/event_questionnaires_questions_id'

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :events, only:[:new, :create, :index, :show, :edit, :update] do
      resources :goods, only:[:new, :create, :index, :show, :edit, :update]
      resources :event_tickets, only:[:create, :new, :index, :show, :edit, :update]
    #   resources :event_repos, only:[:index, :show, :edit, :update, :destroy]
    end
    resources :posts, only: [:destroy]
    resources :ticket_orders, only:[:index, :show, :update]
    resources :ticket_order_details, only:[:update]
    resources :event_questionnaires_questions, only:[:create, :new, :index, :show, :edit, :update]
    # resources :event_questionnaires_answers, only:[:create, :new, :show]
  end

  #ゲストログイン機能のroot
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # namespace :public do
  #   get 'relationships/followings'
  #   get 'relationships/followers'
  # end

  scope module: :public do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
    # resources :customers do
    #   resource :relationships, only: [:create, :destroy]
    #   get 'followings' => 'relationships#followings', as: 'followings'
    #   get 'followers'  =>  'relationships#followers', as: 'followers'
    # end

    resources :events, only: [:new, :create, :index, :show] do
      resources :goods, only: [:index, :show]
      resources :event_tickets, only:[:index, :show]
    end

    resources :posts, only: [:create, :new, :index, :show] do
      resources :events, only: [:new, :create, :index, :show]
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]
    end

    resources :cart_tickets, only:[:create, :index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :ticket_orders, only:[:new, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end

    resources :event_questionnaires_answers, only:[:new, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
    resources :notifications, only: [:index] do
      patch :checked, on: :member
      delete :destroy_all, on: :collection
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
