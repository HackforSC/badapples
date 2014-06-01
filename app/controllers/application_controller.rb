class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_path(options = {});
    options = request.params.symbolize_keys.merge(options); 
    url_for Rails.application.routes.recognize_path(request.path).merge(options)
  end
  helper_method :current_path

end
