class Assignment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :assignable, :polymorphic => true
end
