class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードの入力に誤りがあります。'
      render 'new'
    end
    
  end
  
  
  def destroy
    reset_session
    redirect_to root_path
  end
  
end
