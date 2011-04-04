class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :site_coordinator
      can :manage, [Product, Asset, Issue]
    elsif user.role? :division_coordinator
      can :read, [Product, Asset]
      # manage products, assets he owns
      can :manage, Product do |product|
        product.try(:owner) == user
      end
      can :manage, Asset do |asset|
        asset.assetable.try(:owner) == user
      end
    end
  end
end
