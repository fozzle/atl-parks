class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  before_filter :intercept_html_requests

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def intercept_html_requests
    return if devise_controller?
    render('home/index') if request.format == Mime::HTML
  end
end
