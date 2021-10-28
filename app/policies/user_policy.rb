class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    owner_or_admin?
  end

  def edit?
    update?
  end

  def update?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    record == user || user.admin
  end
end
