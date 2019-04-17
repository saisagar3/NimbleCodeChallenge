class SubscribersController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    authorize @group, :create?
   
    @course = @group.course    
    @student_subscribers = @course.subscribers
      .where("group_id !=? or group_id is null", @group.id)
  end

  def show
    group = Group.find(params[:id])
    redirect_to group_path(group)
  end
    
  def create
    group = Group.find(params[:id])
    authorize group, :create?
    
    subscriber = Subscriber.find(params[:subscriber_id])
    subscriber.group = group
    
    if subscriber.save
      flash[:alert] = "Successfully added!"
      redirect_to group_subscriber_path(group)
    else
      flash[:error] = "Failed to add user!"
      redirect_to group_subscriber_path(group)
    end
  end
    
  def destroy
    group = Group.find(params[:id])
    authorize group, :create?
    
    subscriber = Subscriber.find(params[:subscriber_id])
    subscriber.group = nil
    
    if subscriber.save
      flash[:alert] = "Successfully removed!"
      redirect_to group
    else
      flash[:error] = "Failed to remove from group!"
      redirect_to group
    end
  end  
end
