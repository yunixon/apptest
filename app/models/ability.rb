class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.nil?
      can :manage, User,   id: user.id
      can :manage, Upload, user_id: user.id
    end
  end
end
