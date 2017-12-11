class GroupManager
  # Create new group with members
  def self.create_group_with_users(params)
    group_params = params[:group]
    user_roles = group_params[:user_info_data]
    group_params = group_params.except(:user_info_data)
    user_roles= user_roles.present? ?  user_roles && user_roles.reject!{|a| a["user_id"] == ""} : []
    group = Group.new(name: group_params[:name], description: group_params[:description])

    if group.save
      user_roles.each do |data|
        group.group_users.create(user_id: data[:user_id],role_id: data[:role_id])
      end
    end
    return group
  end


  def self.update_groups_info(params)
    group_params = params[:group]
    user_roles = group_params[:user_info_data]
    group_params = group_params.except(:user_info_data)

    user_roles= user_roles.present? ?  user_roles && user_roles.reject!{|a| a["user_id"] == ""} : []
    group = Group.where(id: group_params[:id]).first
    group.update(name: group_params[:name], description: group_params[:description])

    if group.persisted?
      user_roles.each do |data|
        if data[:group_operation] == "ADD"
          group.group_users.find_or_create_by(user_id: data[:user_id],role_id: data[:role_id])
        else
          user = group.group_users.where(user_id: data[:user_id],role_id: data[:role_id]).first
          user.destroy if user.present?
        end

      end
    end
    return group
  end

end