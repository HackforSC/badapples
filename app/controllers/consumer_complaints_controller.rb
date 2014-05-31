class ConsumerComplaintsController < ApplicationController

  def index
    render :action => :index, :locals => { :complaints => queried_complaints }
  end

private
  def queried_complaints
    ConsumerComplaintQuery.new.in_state("SC")
  end
end
