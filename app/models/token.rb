class Token
  USERNAME = 'some_user'
  PASSWORD = 'secret_pass'

  def self.valid?(username: nil, password: nil)
    username == USERNAME && password == PASSWORD
  end
end
