# frozen_string_literal: true

shared_examples 'forbidden acess' do
  it 'returns error message' do
    expect(body_json['errors']['message']).to eq 'Forbidden access'
  end

  it 'returnd forbidden status' do
    expect(response).to have_http_status(:forbidden)
  end
end
