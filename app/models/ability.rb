# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user) # rubocop:disable Metrics/MethodLength
    # Define abilities for the passed in user here. For example:
    alias_action :create, :read, :update, :destroy, to: :crud
    user ||= User.new # guest user (not logged in)
    if user.persisted?
      can :index, User
      # if user.admin?
      #   can :manage, :all
      # elsif user.basic?
      #   can %i[read contact], Page, active: true
      #   can :read, Setting, active: true
      #   can %i[read mark_as_read unread], Challenge
      #   can %i[crud], Slide
      #   can :read, Product, active: true
      #   can :read, ProductCategory, active: true
      #   can %i[read mark_as_read unread], News
      #   can %i[create destroy], DropZoneFile
      #   can %i[show update update_password destroy_document], User, active: true
      #   can %i[index mark_as_read unread], Notification
      #   can %i[read create], Redeem
      #   can %i[read], Transaction
      #   can %i[read ranking summary], KpiUser
      # end
    else
      # can %i[read contact], Page, active: true
      # can :read, Setting, active: true
      # can :read, Slide, active: true
    end
  end
end
