# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rate article', type: :feature do
  before :context do
    Article.delete_all

    FactoryBot.create_list(:article, 15)
  end

  it 'User adds a rating of 5' do
    visit('/')
    find('h2.title:first-child a').click

    fill_in('rating[rating]', with: 5)
    click_on('Rate')

    expect(page).to have_content('1 reader(s) have given a weighted average rating of 5.0 out of 10')
  end
end
