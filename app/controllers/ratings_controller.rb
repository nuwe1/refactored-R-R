# frozen_string_literal: true

class RatingsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @rating = @article.ratings.create(params[:rating].permit(:rating))
    redirect_to article_path(@article)
  end
end
