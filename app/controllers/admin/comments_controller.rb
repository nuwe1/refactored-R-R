# frozen_string_literal: true

module Admin
  class CommentsController < AdminController

    def update
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])

      if @comment.is_approved?
        @comment.update(is_approved: false)
        flash[:success] = "The comment for \"#{@comment.name}\" has been regected."
        redirect_to admin_article_path(@article)
      else
        @comment.update(is_approved: true)
        flash[:success] = "The comment for \"#{@comment.name}\" has been approved."
        redirect_to admin_article_path(@article)
      end
    end

    def destroy
      article = Article.find(params[:article_id])
      comment = article.comments.find(params[:id])
      comment.destroy
      flash[:success] = "The comment for \"#{comment.name}\" has been deleted."
      redirect_to admin_article_path(article)
    end

  end
end
