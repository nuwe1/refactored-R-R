# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete comment', type: :feature do
  before :context do
    Article.delete_all

    FactoryBot.create_list(:article, 15)
  end

  it ' User should be able to delete a comment' do
    visit('/')
    find('h2.title:first-child a').click

    fill_in('comment[name]', with: 'John Doe')
    fill_in('comment[body]', with: 'Just one of John Does comments')
    click_on('Create Comment')

    expect(page).to have_content('John Doe')

    click_on('Delete')

    expect(page).not_to have_content('John Doe')
  end
end
