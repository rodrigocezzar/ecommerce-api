# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::V1::Categories', type: :request do
  let(:user) { create(:user) }

  context 'Get /categories' do
    let(:url) { '/admin/v1/categories' }
    let!(:categories) { create_list(:category, 5) }

    it 'return all categories' do
      get url, headers: auth_header(user)
      expect(body_json).to contain_exactly *categories.as_json(only: %i[id name])
    end

    it 'returns success status' do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end
end
