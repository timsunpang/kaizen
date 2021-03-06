require 'jwt'

class Auth

  ALGORITHM = 'HS256'

  def self.issue(payload)
    puts "=========================="
    puts auth_secret
    puts "=========================="

    JWT.encode(payload, auth_secret, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(
      token,
      auth_secret,
      true,
      { algorithm: ALGORITHM }
    ).first
  end

  def self.auth_secret
    ENV["AUTH_SECRET"]
  end

end
