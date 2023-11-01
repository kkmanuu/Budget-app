class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new # Guest user

    can :manage, :all

    can :read, Category
    can :read, Purchase
    can :create, Category
    can :manage, Category
  end
end
