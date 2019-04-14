class SubscribersController < ApplicationController
  def add_subscribers
    @group = Group.find(params[:id])
    authorize @group, :edit?
   
    @course = @group.course    
    @student_subscribers = @course.subscribers
      .where("group_id !=? or group_id is null", @group.id)
  end
    
  def add_subscriber
    group = Group.find(params[:id])
    authorize group, :create?
    
    subscriber = Subscriber.find(params[:subscriber_id])
    subscriber.group = group
    
    if subscriber.save
      flash[:alert] = "Successfully added #{subscriber.user.username} to group!"
      redirect_to add_subscribers_group_path(group)
    else
      flash[:error] = "Failed to add to #{subscriber.user.username} group!"
      redirect_to add_subscribers_group_path(group)
    end
  end
    
  def remove_subscriber
    group = Group.find(params[:id])
    authorize group, :create?
    
    subscriber = Subscriber.find(params[:subscriber_id])
    subscriber.group = nil
    
    if subscriber.save
      flash[:alert] = "Successfully removed #{subscriber.user.username} from group!"
      redirect_to group
    else
      flash[:error] = "Failed to remove #{subscriber.user.username} from group!"
      redirect_to group
    end
  end  
end
