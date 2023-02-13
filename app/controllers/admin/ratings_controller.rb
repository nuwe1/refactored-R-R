# frozen_string_literal: true

module Admin

  class RatingsController < AdminController

    def update
      @article = Article.find(params[:article_id])
      @rating = @article.ratings.find(params[:id])

      if @rating.is_approved?
        @rating.update(is_approved: false)
        flash[:success] = "The rating of \"#{@rating.rating}\" has been regected."
        redirect_to admin_article_path(@article)
      else
        @rating.update(is_approved: true)
        flash[:success] = "The rating of \"#{@rating.rating}\" has been approved."
        redirect_to admin_article_path(@article)
      end
    end

    def destroy
      article = Article.find(params[:article_id])
      rating = article.ratings.find(params[:id])
      rating.destroy
      flash[:success] = "The rating of \"#{rating.rating}\" has been deleted."
      redirect_to admin_article_path(article)
    end

  end

end
