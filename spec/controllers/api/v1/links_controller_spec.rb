require 'rails_helper'

RSpec.describe 'Links Api', type: :request do
  before do
    post '/api/v1/links', params: { url: 'https://abubakardiallo.com', slug: 'shorty' }
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
