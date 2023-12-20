module Admin
  class RootController < ApplicationController
    before_action :ensure_admin_session

    def index
      @helper_names = AdminRoutes.new.helper_names
    end

    def set_admin_session
      session[:admin] = true
    end

    def clear_admin_session
      session[:admin] = false
    end

    def admin_session?
      session[:admin].present?
    end

    def admin_locked?
      locked = ENV['ADMIN_LOCKED']
      locked.blank? || locked == 'false'
    end

    def ensure_admin_session
      redirect_to root_path unless admin_session? || request.controller_class == Admin::SessionsController
    end
  end
end