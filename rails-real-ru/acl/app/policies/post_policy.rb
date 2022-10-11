# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user
  end

  def new?
    user
  end

  def update?
    record.author_id == user&.id || user&.admin?
  end

  def edit?
    record.author_id == user&.id || user&.admin?
  end

  def destroy?
    user&.admin?
  end
  # END
end
