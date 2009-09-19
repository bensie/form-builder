ActionController::Routing::Routes.draw do |map|
  map.resources :forms, :member => { :sort_fields => :post } do |forms|
    forms.resources :submissions, :collection => { :thank_you => :get }
  end
  map.root :controller => :forms, :action => :index
end
