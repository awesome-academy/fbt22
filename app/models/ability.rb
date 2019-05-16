class Ability
  include CanCan::Ability

  def initialize user
    return undefine_user if user.blank?
    return permission_admin if user.admin?
    can :create, [Booking, Review, Comment, Like]
    can :destroy, Like, user_id: user.id
    can [:show, :edit, :update, :destroy], Review, user_id: user.id
    can [:index, :change_status], Booking, user_id: user.id
  end

  private

  def permission_admin
    can :manage, :all
  end

  def undefine_user
    can :read, Tour
  end
end
