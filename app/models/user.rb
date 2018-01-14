class User < ApplicationRecord
  has_secure_password

  include Sluggable

  validates :email,
    presence: true,
    format: /.+@.+\..+/i,
    uniqueness: true

  before_validation { |user| user.email = user.email.downcase.strip }

  def to_token_payload
    {
      sub: id,
      name: name,
      email: email,
      slug: slug
    }
  end

  def self.from_token_request(request)
    email = request.params['auth'] && request.params['auth']['email']
    self.find_by email: email.downcase.strip
  end
end
