class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp=24.hours.from_now)
    #set expery to 24 hours from creation time
    payload[:exp] = exp.to_i
    #sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end