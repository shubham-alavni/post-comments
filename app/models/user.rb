class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  
  has_many :posts
  has_many :comments
end