# Users Controller
class UsersController < ApplicationController
  def index
    # current_user.user_type == "Management" ? @users = User.where.not(:user_type => "Management") : @users = User.where.not(:user_type => ["Management","Admin"])
    @users = User.where.not(user_type: 'Management') if current_user.user_type == 'Management'
    @users = User.where.not(user_type: ['Management', 'Admin']) if current_user.user_type == 'Admin'
    @users = User.where(user_type: 'Employee') if current_user.user_type == 'Hiring Manager'
  end

  def show
    @user  = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
  end

  def demo_sql_injection

    # binding.pry
    flash[:notice] = Article.where("url = '#{params[:demo][:title]}'")
    redirect_to request.referrer

  end



end
