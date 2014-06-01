class ConsumerComplaintsController < ApplicationController

  def index
    render :action => :index, :locals => { :complaints => queried_complaints }
  end

  def complaint_breakdown
    render :action => :complaint_breakdown, :locals => { :complaints => queried_complaints }
  end

private
  def queried_complaints
    ConsumerComplaintQuery.new
      .in_state(selected_state)
      .first(100)
  end

  def selected_state
    params[:state]
  end
end
