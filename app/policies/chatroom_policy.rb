class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where('guest_id = ? OR host_id = ?', user, user)
    end
  end
  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
