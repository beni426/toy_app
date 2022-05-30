class User < ApplicationRecord
  has_many :microposts
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: %r{\A[\w.!#$%&'*+/=?^`{|}~-]+@[\w.-]+\.[\w-]+\z}i },
                  uniqueness: true
  before_validation { email.downcase! }
end
