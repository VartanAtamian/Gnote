class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :secretHash, presence: true, confirmation: true
end
