Rails.application.routes.draw do
  devise_for :admin_users, module: :devise, path: 'backend/auth'

  root to: 'frontend/site#index'
  namespace :frontend, path: '' do
    get 'about' => 'site#about'
    get 'contact' => 'site#contact'

    resources :projects,  only: [:index, :show]
    resources :applications, only: [:create]
    resources :vacancies, only: [:index]

    resources :news_articles, path: 'news', only: [:index, :show]
  end

  get 'admin' => redirect('backend')
  namespace :backend do
    get '/' => redirect('backend/news')

    resources :projects
    #resources :vacancies
    resources :applications, only: [:index, :show, :destroy]
    resources :news_articles, path: 'news', except: [:show]

    resources :galleries, only: [] do
      resources :gallery_photos, only: [:index, :create, :destroy], path: 'photos'
    end

    resources :admin_users, path: 'admin-users'

    resources :wysiwyg_attachments, only: [:index, :create, :show]
    resources :wysiwyg_videos, only: [:index, :create, :show]

    resources :site_settings, path: 'settings', only: [:index] do
      collection do
        put :update
      end
    end
  end
end