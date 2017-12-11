class GroupUser < ApplicationRecord

  belongs_to :role, :foreign_key => :role_id
  belongs_to :user
  belongs_to :group

  # Validations
  validates_presence_of :role_id, :user_id, :group_id

end
