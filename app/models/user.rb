class User < ActiveRecord::Base
  attr_accessible :email, :password, :status, :user_token
end
