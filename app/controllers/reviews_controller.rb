class ReviewsController < ApplicationController
    before_action :require_login

    def create
        review = Review.new(review_params)
        session[:return_to] ||= request.referer
        if review.save
            # TODO: alert that review was created
            # flash[:notice] = 'Review created!'
        end
        redirect_to session.delete(:return_to)
    end

    def destroy
        @product = Product.find params[:product_id]
        @review = @product.reviews.find params[:id]
        @review.destroy
        session[:return_to] ||= request.referer
        redirect_to session.delete(:return_to)
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

    def require_login
        if !current_user
            # TODO: alert that user must be logged in
            # flash[:error] = "You must be logged in to review!"
            redirect_to login_url
        end
    end
end
