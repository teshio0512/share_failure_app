class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
