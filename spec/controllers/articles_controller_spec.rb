# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:article) { FactoryBot.create(:article) }

    it 'renders :show template' do
      get :show, params: { id: article }

      expect(response).to render_template(:show)
    end

    it 'returns a 200' do
      request.headers['Authorization'] = 'article'
      get :show, params: { id: article }
      expect(response).to have_http_status(:ok)
    end

    it 'assigns requested article to @article' do
      get :show, params: { id: article }
      expect(assigns(:article)).to eq(article)
    end
  end
end
