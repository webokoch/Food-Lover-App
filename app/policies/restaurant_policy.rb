class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def users_restaurants?
    true
  end

  def create?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user 
  end
end
