ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'site'
  
  map.admin_dashboard '/admin', :controller => 'admin/dashboard', :action => 'index'
  map.admin_home_page '/admin/home-page', :controller => 'admin/home_page', :action => 'index'
  map.admin_search '/admin/search', :controller => 'admin/searches', :action => 'show'
  map.namespace :admin do |admin|
    admin.resources :accounts
    admin.resources :billboards
    admin.resources :gallery_photos
    admin.resources :specials
    admin.resources :videos
    admin.resources :advertisements
    admin.resources :courses
    admin.resources :pages
    admin.resources :instructors
    admin.resources :students
    admin.resources :schedules do |schedules|
      schedules.resources :programs
    end
  end
  
  map.resources :students, :only => [ :index, :show, :edit, :update ]
  map.resources :schedules, :only => [ :index ]
  map.resource :sessions
  
  map.activate '/activate/:activation_code', :controller => 'sessions', :action => 'activate'
  map.login "login", :controller => "sessions", :action => "new"
  map.logout "logout", :controller => "sessions", :action => "destroy"
  map.about '/about-us', :controller => 'site', :action => 'about'
  map.contact '/contact', :controller => 'site', :action => 'contact'
  map.disciplines '/disciplines', :controller => 'site', :action => 'disciplines'
  map.instructors '/instructors', :controller => 'site', :action => 'instructors'
  map.programs '/programs', :controller => 'site', :action => 'programs'
  map.missing_page '/missing-page', :controller => 'pages', :action => 'missing'
  map.connect '/:permalink', :controller => 'pages', :action => 'show'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
