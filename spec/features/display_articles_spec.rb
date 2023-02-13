# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Load home page', type: :feature do
  before :context do
    Article.delete_all

    FactoryBot.create_list(:article, 15)
  end

  it ' User should see article titles on home page' do
    visit('/')
    expect(page).to have_content(Article.first.title)
  end
end
