# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatingsController do
  describe 'post rating' do
    let(:article) { FactoryBot.create(:article) }

    context 'with valid params' do
      it 'redirects to articleshow' do
        # /articles/:article_id/ratings(.:format)
        post :create, params: { article_id: article.id, rating: FactoryBot.attributes_for(:rating) }
        expect(response).to redirect_to(article_path(article))
      end

      it 'adds a new rating to the database' do
        expect do
          post :create, params: { article_id: article.id, rating: FactoryBot.attributes_for(:rating) }
        end.to change(Rating, :count).by(1)
      end

      it 'assigns a newly created rating as @rating' do
        post :create, params: { article_id: article.id, rating: FactoryBot.attributes_for(:rating) }

        expect(assigns(:rating)).to be_a(Rating)
        expect(assigns(:rating)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rating as @rating' do
        post :create, params: { article_id: article.id, rating: { rating: '' } }

        expect(assigns(:rating)).to be_a_new(Rating)
      end
    end
  end
end
