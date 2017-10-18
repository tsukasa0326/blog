class UserController < ApplicationController
    
     def index
         
         @users = User.all.order(created_at: 'asc')
         
     end
    
     def new
         @user = User.new
     end

     def create
         @user = User.new(user_params)
            if @user.save
                redirect_to user_index_path
            else
                 render 'new'
            end
     end
     
     def show
     
     @user = User.find(params[:id])
     
     end

     private

    def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    
end
