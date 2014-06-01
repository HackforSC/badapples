BadApples::Application.routes.draw do
  root :to                     => "consumer_complaints#index",                  :as => :home
  post "/search"                => "consumer_complaints#search",                :as => :search
  get "/search"                 => "consumer_complaints#index"
  get  "/complaint_breakdown"   => "consumer_complaints#complaint_breakdown",   :as => :complaint_breakdown
  post "/complaint_breakdown"   => "consumer_complaints#complaint_breakdown"
end
