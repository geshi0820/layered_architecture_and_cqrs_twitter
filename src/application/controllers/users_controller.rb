module UsersController
  def show
    @user = View::User.find(id)
  end

  def new
    @user = View::UserForm.new
  end

  def create
    usecase = CreateUserCommand.new(@@user_repository)
    usecase.run!(user_params)
  end

  def create_on_success(user_id)
    redirect_to user_path(id: user_id)
  end

  def create_on_failure
    @user = View::UserForm.new(user_params)
    render action: 'new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :email)
  end
end

class UsersController < ApplicationController
  @@user_repository = UserRepositoryOnMySQL
  include UsersController
end
