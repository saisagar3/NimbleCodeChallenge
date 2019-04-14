module CourseSubscriptionsConcerns

  # POST /courses/:id/subscribe  
  def subscribe
    @course.subscribe current_user
    if @course.save
      flash[:alert] = "Successfully subscribed!"
      redirect_to @course
    end
  end

  def unsubscribe
    @course.unsubscribe current_user
      flash[:alert] = "Unsubscribed."
      redirect_to @course
  end

  def groups
    @groups = @course.groups
  end

  def new_group
    @group = Group.new(course: @course)
    authorize @group, :new?
  end

  def create_group
    group = Group.new(course: @course,
                      name: params[:group][:name],
                      project_name: params[:group][:project_topic])
    authorize group, :create?

    if group.save
      flash[:alert] = "Successfully created group!"
      redirect_to group
      return
    else
      flash[:error] = "Failed created group!"
      redirect_to new_group_course_path(@course)
      return
    end
  end

  def subscribers
    authorize @course, :create?

    @filtered_subscribers = @course.subscribers
    if not params[:name].blank?
      name = params[:name].downcase
      @filtered_subscribers = @filtered_subscribers.includes(:user)
        .where("LOWER(users.first_name) like ? OR LOWER(users.last_name) like ?", "%#{name}%", "%#{name}%").references(:users)
    end

    if not params[:student_id].blank?
      student_id = params[:student_id].downcase
      @filtered_subscribers = @filtered_subscribers.includes(:user)
        .where("LOWER(users.institute_id) like ?", "%#{student_id}%").references(:users)
    end

    if not params[:course].nil?
      if not params[:course][:group_ids].blank?
        group_id = params[:course][:group_ids]
        @filtered_subscribers = @filtered_subscribers.where(group_id: group_id)
      end
    end
  end

end