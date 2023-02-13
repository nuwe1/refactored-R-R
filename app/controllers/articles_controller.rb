# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.released
  end

  def show
    @article = Article.released.find(params[:id])
  end
end
