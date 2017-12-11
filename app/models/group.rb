class Group < ApplicationRecord
  # Associations
  has_many :group_users
  has_many :users, through: :group_users

  # Validations
  validates_presence_of :name

  attr_accessor :user_info_data

end
