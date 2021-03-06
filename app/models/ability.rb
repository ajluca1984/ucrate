# frozen_string_literal: true

class Ability
  include Hydra::Ability
  include Hyrax::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end

    can :show, CollectionExport do |collection_export|
      collection_export.user == current_user.email ||
        (current_user.can? :show, look_for_collection(collection_export))
    end

    can :destroy, CollectionExport do |collection_export|
      collection_export.user == current_user.email ||
        (current_user.can? :destroy, look_for_collection(collection_export))
    end

    can [:show, :destroy], CollectionExport if current_user.admin?
    can [:create, :show, :add_user, :remove_user, :index, :edit, :update, :destroy], Role if current_user.admin?
  end

  private

    def look_for_collection(collection_export)
      Collection.find(collection_export.collection_id)
    rescue Ldp::Gone
      nil
    end
end
