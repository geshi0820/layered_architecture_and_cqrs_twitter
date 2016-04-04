class CreateUserCommand
  def initialize(user_repository)
    @user_repository = user_repository
    @subscribers = []
  end

  def add_subscribers()
  end

  def run!(user_params)
    user = User.new(user_params)
    if @user_repository.store(user)
    else
    end
    publish!
  end

  def publish!
  end
end
