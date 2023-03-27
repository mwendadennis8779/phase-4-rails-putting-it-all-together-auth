class RecipesController < ApplicationController
    def index
        render json: Recipe.all, include: :user
    end

    
    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created, include: :user
    end

    private

    def recipe_params
        params.permit(:user_id, :title, :instructions, :minutes_to_complete)
    end
end
