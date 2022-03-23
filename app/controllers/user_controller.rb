class UserController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:create]

    def create
        if (params[:password] != nil) && (params[:password] === params[:password_confirmation])
            user = User.create!(user_params)
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Password can't be blank"] }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
