class RecipesController < ApplicationController
    before_action :authorize
    
    def create
        recipe = Recipe.create!(title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete], user_id: session[:user_id])
        render json: recipe, include: :user, status: :created
    end

    def index
        recipes = Recipe.all
        render json: recipes, include: :user
    end

end
