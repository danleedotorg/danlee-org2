module Admin
  class SessionsController < RootController
    before_action :check_admin_lock
    # skip_after_action :ensure_admin_session
    def new

    end

    def create
      session_params = params.permit(:username, :password)
      username = session_params[:username]
      password = session_params[:password]

      pp ENV['ADMIN_USERNAME']
      pp username
      pp ENV['ADMIN_USERNAME'] == username

      pp ENV['ADMIN_PASSWORD']
      pp password
      pp ENV['ADMIN_PASSWORD'] == password

      if username != ENV['ADMIN_USERNAME'] || password != ENV['ADMIN_PASSWORD']
        ENV['ADMIN_LOCKED'] = 'true'
        clear_admin_session
        redirect_to root_path
      else
        set_admin_session
        redirect_to admin_blogs_path
      end
    end

    private

    def check_admin_lock
      redirect_to root_path unless admin_locked?
    end
  end
end