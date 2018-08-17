class ReviewsController < ApplicationController
    def create
        review = Review.new(review_params)
        session[:return_to] ||= request.referer
        if review.save
            redirect_to session.delete(:return_to), notice: 'Review created!'
        else
            redirect_to session.delete(:return_to)
        end
    end
    
    private
    def review_params
        review_params = {
            product_id: params[:product_id],
            user_id: current_user.id,
            description: params[:product][:review][:description],
            rating: params[:product][:review][:rating]
        }
    end
end
