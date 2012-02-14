class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user == User.first
      can :access, :rails_admin
      can :manage, :all
    else
      can :read, :all
    end
  end
end
