class ApplicationController < ActionController::API
  SECRET = 'bf94c0957face1ae96b04760c4a778e4c22268da880b857925ce7'

  def encode_token(payload)
    JWT.encode(payload, SECRET)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]

      begin
        JWT.decode(token, SECRET, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized?
    decoded_token.present?
  end

  def require_authorization
    render json: { message: 'Please log in' }, status: :unauthorized unless authorized?
  end
end
