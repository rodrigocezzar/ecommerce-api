# frozen_string_literal: true

require 'rails_helper'

describe 'Home', type: :request do
  let(:user) { create(:user) }

  it 'Test body home' do
    get '/admin/v1/home', headers: auth_header(user)
    expect(body_json).to eq({ 'message' => 'uhull' })
  end

  it 'Test response home' do
    get '/admin/v1/home', headers: auth_header(user)
    expect(response).to have_http_status(:ok)
  end
end
