class ApplicationController < ActionController::Base
    def require_user
        # if the user is a guest, then redirect to login page
        if guest?
            flash[:notice] = "Please login first."
            redirect_to login_path
        end
    end

    def already_signed_in?
        if !guest?
            flash[:notice] = "You are already logged in!"
            redirect_to blogs_path
        end
    end

    def guest?
        !helpers.logged_in?
    end
end
