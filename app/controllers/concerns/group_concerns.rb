module GroupConcerns

    def edit_name
    end
  
    # PUT /groups/1/update_name
    def update_name
      if @group.has_user? current_user
        @group.name = params[:group][:name]
  
        if @group.save
          flash[:alert] = "Successfully updated name of group to #{params[:name]}."
        else
          flash[:error] = "Failed to update the name of the group."
        end
        redirect_to @group
      else
        flash[:error] = "You must be a member of the group to update it's name."
        redirect_to @group
      end
    end
  
    # GET /groups/1/edit_project_topic
    def edit_project_name
      authorize @group, :create?
    end
  
    # PUT /groups/1/update_project_topic
    def update_project_name
      authorize @group, :create?
  
      @group.project_name = params[:group][:project_name]
  
      if @group.save
        flash[:alert] = "Successfully updated project topic."
      else
        flash[:error] = "Failed to update the project topic."
      end
      redirect_to @group
    end
  
    # GET /groups/1/edit_grade
    def edit_score
    end

    # PUT /groups/1/update_grade
  def update_score
    # TODO before_action set_group not working, find out why.
    @grade = Group.find(params[:id]) # Temporary fix for before_action problem.
    authorize @grade, :create?

    @group.score = params[:group][:score]

    if @group.save
      flash[:alert] = "Successfully updated grade."
    else
      flash[:error] = "Failed to update grade."
    end
    redirect_to @group
  end
end