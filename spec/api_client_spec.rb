require 'rails_helper' # Or 'spec_helper' if you don't need Rails features

describe YourConnector::ApiClient do # Example: Assuming your SDK has an ApiClient class
  let(:api_client) { YourConnector::ApiClient.new(api_key: ENV['WORKATO_API_KEY']) } # Instantiate your SDK client

  describe '#fetch_data' do
    context 'when the API returns a successful response' do
      it 'returns the parsed data', vcr: { record: :once } do # Use VCR to record the interaction
        response = api_client.fetch_data(some_parameter: 'value')
        expect(response).to be_an(Array)
        expect(response.first).to have_key('id')
        # Add more specific expectations based on the API response
      end
    end

    context 'when the API returns an error' do
      it 'raises an appropriate error', vcr: { record: :once } do
        expect { api_client.fetch_data(invalid_parameter: 'value') }.to raise_error(YourConnector::ApiError)
        # You might want to check the error message or status code as well
      end
    end
  end

  # Add more 'describe' blocks for other methods in your SDK
end