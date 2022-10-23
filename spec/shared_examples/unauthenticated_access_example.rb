# frozen_string_literal: true

shared_examples 'unauthenticated access' do
  it 'returnd unauthorized status' do
    expect(response).to have_http_status(:unauthorized)
  end
end
