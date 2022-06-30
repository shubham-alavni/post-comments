# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
