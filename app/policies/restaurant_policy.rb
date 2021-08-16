class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    # Who is allowed to edit a restaurant ?
    # The user that created it
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end

  private

  def admin_or_owner?
    owner? || admin?
  end

  def owner?
    user == record.user
  end

  def admin?
    user.admin
  end
end
