class UsersController < ApplicationController
    before_action :set_user, only: [:show, :activate, :deactivate]

    def show
        render json: @user, status: :ok
    end

    def activate
        @user.update(active: true)

        render json: @user, status: :ok
    end

    def deactivate
        @user.update(active: false)

        render json: @user, status: :ok
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
