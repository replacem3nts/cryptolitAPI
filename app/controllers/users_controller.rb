class UsersController < ApplicationController
    def index
        user = User.all
        render json: user, only: [:id, :username]
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

end
