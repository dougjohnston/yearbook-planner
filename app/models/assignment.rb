class Assignment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :yearbook
  belongs_to :user
  belongs_to :assignable, :polymorphic => true
end
