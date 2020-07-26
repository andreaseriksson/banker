class ApplicationController < ActionController::API
  SECRET = 'bf94c0957face1ae96b04760c4a778e4c22268da880b857925ce7'

  def encode_token(payload)
    JWT.encode(payload, SECRET)
  end
end
