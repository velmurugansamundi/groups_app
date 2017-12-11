class User < ApplicationRecord
  # Associations
  has_many :group_users
  has_many :groups, through: :group_users

  # Validations
  validates_presence_of :name,:email,:gender
end
