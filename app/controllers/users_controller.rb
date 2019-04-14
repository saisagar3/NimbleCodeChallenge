class UsersController < ApplicationController
        before_action :set_user, except: [:index, :create, :new]
        before_action :authenticate_user!, except: []
      
        # GET /users
        # GET /users.json
        def index
          @users = User.where(role: User.roles.find(1))
        end
      
        # GET /users/1
        # GET /users/1.json
        def show
          authorize @user
        end
      
        # GET /users/new
        def new
          @user = User.new
          authorize @user
        end
      
        # GET /users/1/edit
        def edit
          authorize @user
        end
      
        # POST /users
        # POST /users.json
        def create
          @user = User.new(user_params)
          @user.role = "Student"
          authorize @user
      
          respond_to do |format|
            if @user.save
              format.html { redirect_to @user, notice: 'user was successfully created.' }
              format.json { render :show, status: :created, location: @user }
            else
              format.html { render :new }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
        end

        def update
            authorize @user
            respond_to do |format|
              if @user.update(user_params)
                format.html { redirect_to @user, notice: 'user was successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
              else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
              end
            end
        end
        

        def destroy
            authorize @user
            @user.destroy
            respond_to do |format|
              format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
              format.json { head :no_content }
            end
          end
        
          private
            # Use callbacks to share common setup or constraints between actions.
            def set_user
              @user = User.find(params[:id])
            end
        
            # Never trust parameters from the scary internet, only allow the white list through.
            def user_params
              params.require(:user).permit(:first_name, :last_name, :institute_id, :citizen_id,
                                           :password, :password_confirmation,  )
            end
end
