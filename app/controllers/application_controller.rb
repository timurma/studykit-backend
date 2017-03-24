class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Authenticable
end
