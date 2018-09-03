require 'jwt'
class JsonWebToken
  # Decodes the JWT with the signed secret
  def self.decode(token)
    JWT.decode(token, public_key, true, algorithm: 'RS256')
  end

  # Validates the payload hash for expiration and meta claims
  def self.valid_payload(payload)
    if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
      false
    else
      true
    end
  end

  # Default options to be encoded in the token
  def self.meta
    {
      exp: 7.days.from_now.to_i,
      iss: 'issuer_name',
      aud: 'client'
    }
  end

  # Validates if the token is expired by exp parameter
  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end

  def self.public_key
    OpenSSL::PKey::RSA.new(File.open(Rails.root.join('config/public.pem'), 'r:UTF-8'))
  end
end
