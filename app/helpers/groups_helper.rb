module GroupsHelper

  def group_created_data(group)
    group.created_at.present? ? group.created_at.strftime("%I:%M %p %b %d, %Y") : ""
  end

  def group_users_by_roles(group)
    data = {}
    data = group.group_users.group_by{|a|a.role.name}
    # if users.present?
    #   data
    #
    # end
    p "33333333333333333333"
    p "33333333333333333333"
    p "33333333333333333333"
    p data
    data
  end
end
