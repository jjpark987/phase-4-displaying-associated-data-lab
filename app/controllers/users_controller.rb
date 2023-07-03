class UsersController < ApplicationController
    def show 
        render json: User.find(params[:id]), except: [:created_at, :updated_at], include: [:items]
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
    end
end
