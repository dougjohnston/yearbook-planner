class School < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :yearbooks
end
