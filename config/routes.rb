Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :stylesheets do
    resources :stylesheets, :only => [:index, :show]
  end

  # Admin routes
  namespace :stylesheets, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :stylesheets, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
