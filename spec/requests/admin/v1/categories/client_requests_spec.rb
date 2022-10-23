# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::V1::Categories as :client', type: :request do
  let(:user) { create(:user, profile: :client) }

  context 'Get /categories' do
    let(:url) { '/admin/v1/categories' }
    let!(:categories) { create_list(:category, 5) }

    before(:each) { get url, headers: auth_header(user) }

    include_examples 'forbidden acess'
  end

  context 'Post /categories' do
    let(:url) { '/admin/v1/categories' }

    before(:each) { post url, headers: auth_header(user) }

    include_examples 'forbidden acess'
  end

  context 'Patch /categories' do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }

    before(:each) { patch url, headers: auth_header(user) }

    include_examples 'forbidden acess'
  end

  context 'Delete /categories' do
    let(:category) { create(:category) }
    let(:url) { "/admin/v1/categories/#{category.id}" }

    before(:each) { delete url, headers: auth_header(user) }

    include_examples 'forbidden acess'
  end
end
