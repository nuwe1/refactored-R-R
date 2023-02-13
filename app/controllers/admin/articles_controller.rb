# frozen_string_literal: true

module Admin
  class ArticlesController < AdminController
    def index
      @articles = Article.order(released_at: :desc)
    end

    def show
      @article = Article.find(params[:id])
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        flash[:success] = "The article \"#{@article.title}\" has been saved."
        redirect_to admin_articles_path
      else
        render :edit
      end
    end

    def destroy
      article = Article.find(params[:id])
      article.destroy
      flash[:success] = "The article \"#{article.title}\" has been deleted."
      redirect_to admin_articles_path
    end

    def article_params
      params.require(:article).permit(:title, :excerpt, :body, :released_at)
    end
  end
end
