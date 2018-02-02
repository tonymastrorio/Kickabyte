class UsersController < ApplicationController

    def edit
        if current_user != User.find(params[:id])
            redirect_to root_path
        end
        @user = current_user
    end

    def update
        if current_user != User.find(params[:id])
            redirect_to root_path
        end
        @user = current_user
        @user.update(user_params)
        redirect_to edit_user_path
    end

    private

    def user_params
        params.require(:user).permit(:display_name)
    end

end
