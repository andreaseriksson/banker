class TokensController < ApplicationController
  def create
    if Token.valid?(credentials)
      token = encode_token(session: 'some_session_id')

      render json: { token: token }, status: :created
    else
      render json: { error: 'wrong username or password' }, status: :unprocessable_entity
    end
  end

  private

  def credentials
    { username: token_params['username'], password: token_params['password'] }
  end

  def token_params
    params.require(:credentials).permit(:username, :password)
  end
end
