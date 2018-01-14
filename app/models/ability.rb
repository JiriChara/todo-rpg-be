class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, User
    end
  end
end
