class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user == User.first
      can :access, :rails_admin
      can :manage, :all
    else
      can :read, Post, published: true
    end
  end
end
