class TokensController < Knock::AuthTokenController
private
  def entity_name
    'User'
  end
end
