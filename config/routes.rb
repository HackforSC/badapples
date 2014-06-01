BadApples::Application.routes.draw do
  root :to                     => "consumer_complaints#index",                  :as => :home
  get  "/complaint_breakdown"   => "consumer_complaints#complaint_breakdown",    :as => :complaint_breakdown
  post "/complaint_breakdown"   => "consumer_complaints#complaint_breakdown"
end
