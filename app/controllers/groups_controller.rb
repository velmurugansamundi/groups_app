class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]

  def index
    @groups = Group.includes(:group_users=> [:role])
    @results = @groups.page(params[:page]).per_page(15)
  end

  def new
    @group = Group.new()
  end

  def create
    @group = GroupManager.create_group_with_users(params)

    respond_to do |format|
      if @group.persisted?
        format.html { redirect_to  groups_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        p @group.errors
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit

  end

  def show

  end

  def update
    @group = GroupManager.update_groups_info(params)
    respond_to do |format|
      if @group.persisted?
        format.html { redirect_to  groups_path, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        p @group.errors
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description,:user_info_data)
  end

  def set_group
    @group = Group.includes(:group_users=> [:role,:user]).where(id: params[:id]).first
  end

end
