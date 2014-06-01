class ConsumerComplaintsController < ApplicationController

  def index
    render :action => :index, :locals => { :complaints => queried_complaints.first(40) }
  end

  def complaint_breakdown
    render :action => :complaint_breakdown, :locals => { :complaints => queried_complaints }
  end

private
  def queried_complaints
    ConsumerComplaintQuery.new.in_state(selected_state)
  end

  def selected_state
    params[:state]
  end
end
