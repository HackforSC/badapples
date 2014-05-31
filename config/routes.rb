BadApples::Application.routes.draw do
  root :to                     => "consumer_complaints#index",                :as => :home
end
