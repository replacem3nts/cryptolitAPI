class UsersController < ApplicationController
    def index
        user = User.all
        render json: user, only: [:id, :username]
    end

    def create
        user = User.create(user_params)
        response json: user
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    private

    def user_params
        params.permit(:username)
    end

end
