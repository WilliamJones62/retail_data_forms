class ApplicationController < ActionController::Base
  before_action :authenticate_user6!
  protect_from_forgery with: :exception
end
