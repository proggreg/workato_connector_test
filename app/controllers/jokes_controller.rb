class JokesController < ActionController::API
  include HTTParty
  base_uri 'https://official-joke-api.appspot.com'

  def get_joke
    begin
      response = self.class.get('/random_joke')
      
      if response.success?
        render json: response.parsed_response
      else
        render json: { error: 'Failed to fetch joke' }, status: :unprocessable_entity
      end
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
