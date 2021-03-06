class GroupsController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    @groups = Group.all
  end

  def show
    @group = Group.find params[:id]
  end

  def update
    # sleep 5
    @group = Group.find params[:id]
    if @group.update_attributes group_params
      render "groups/show"
    else
      respond_with @group
    end   
  end

  def create
    # sleep 2
    @group = Group.new

    if @group.update_attributes group_params
      render "groups/show"
    else
      respond_with @group
    end
  end

  def destroy
    # sleep 2
    group = Group.find params[:id]
    group.destroy()
    render json: {}
  end

  private

    def group_params
      params.require(:group).permit(:name, :wod_prototype_id)
    end
end