require 'rails_helper'
require 'net/http'

RSpec.describe JokesController, type: :controller do
  describe 'GET #get_joke' do
    context 'when the API request is successful' do
      it 'returns a successful response with a joke' do
        VCR.use_cassette('joke_api') do
          uri = URI('https://official-joke-api.appspot.com/random_joke')
          response = Net::HTTP.get(uri)
          puts("response", response)
        end
      end
    end
  end
end