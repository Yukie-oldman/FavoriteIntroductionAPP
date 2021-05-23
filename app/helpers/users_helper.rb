module UsersHelper

  # def top
  #   @accounts = Account.where(user_id: current_user.id)
  #   debugger
  # end

    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
