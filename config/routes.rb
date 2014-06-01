BadApples::Application.routes.draw do
  root :to                     => "consumer_complaints#index",             :as => :home
  post "/search"               => "consumer_complaints#search",            :as => :search
  get  "/search"               => "consumer_complaints#index"
  get  "/company_details"      => "consumer_complaints#company_details",   :as => :company_details
end
