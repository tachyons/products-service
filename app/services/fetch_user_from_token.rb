class FetchUserFromToken
  class MissingAuthHeader < StandardError; end
  class InvalidToken < StandardError; end

  def initialize(header)
    @header = header
  end

  def call
    raise MissingAuthHeader unless @header.present?
    begin
      token = JsonWebToken.decode(auth_header).first
    rescue JWT::DecodeError => e
      Rails.logger.info e.message
      raise InvalidToken e.message
    end
    raise InvalidToken unless JsonWebToken.valid_payload(token)
    User.new(id: token['user_id'])
  end

  private

  attr_reader :header
  def auth_header
    header.split(' ').last
  end
end
