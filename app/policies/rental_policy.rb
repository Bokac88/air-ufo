class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(customer_id: user.id)
    end
  end

  def create?
    true
  end
end
