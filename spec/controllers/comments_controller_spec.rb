# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController do
  describe 'post_comment' do
    let(:article) { FactoryBot.create(:article) }

    context 'with valid params' do
      it 'redirects to articleshow' do
        # /articles/:article_id/comments
        post :create, params: { article_id: article.id, comment: FactoryBot.attributes_for(:comment) }
        expect(response).to redirect_to(article_path(article))
      end

      it 'creates new comment in database' do
        expect do
          post :create, params: { article_id: article.id, comment: FactoryBot.attributes_for(:comment) }
        end.to change(Comment, :count).by(1)
      end

      it 'assigns a newly created comment as @comment' do
        post :create, params: { article_id: article.id, comment: FactoryBot.attributes_for(:comment) }

        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved comment as @comment' do
        post :create, params: { article_id: article.id, comment: { name: 'babs', body: '' } }

        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'removes a deleted comment' do
      # /articles/:article_id/comments/:id(.:format)
      article = Article.create(title: 'just a title')
      comment = article.comments.create!(body: 'first comment')
      expect do
        delete :destroy, params: { article_id: article.id, id: comment.id }
      end.to change(Comment, :count).by(-1)
    end

    it 'redirects to article#show after deleting the comment' do
      # /articles/:article_id/comments/:id(.:format)
      article = Article.create(title: 'just a title')
      comment = article.comments.create!(body: 'first comment')
      delete :destroy, params: { article_id: article.id, id: comment.id }
      expect(response).to redirect_to(article_path(article))
    end
  end
end
