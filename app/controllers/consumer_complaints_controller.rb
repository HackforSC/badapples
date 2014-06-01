class ConsumerComplaintsController < ApplicationController

  # GET /index
  #----------------------------------------------------------------------------
  def index
    render :action => :index, :locals => { :complaints => queried_complaints }
  end

  # POST /search
  #----------------------------------------------------------------------------
  def search
    render :action => :index, :locals => { :complaints => queried_complaints }
  end

private
  def queried_complaints
    ConsumerComplaintQuery.new
      .by_state_and_product(selected_state, selected_product)
      .first(100)
      .sort! { |a, b| a.created_at <=> b.created_at }
  end

  def selected_state
    params[:state].blank? ? nil : params[:state]
  end

  def selected_zip_code
    params[:zip_code].blank? ? nil : params[:zip_code]
  end

  def selected_product
    params[:product].blank? ? nil : params[:product]
  end
end
