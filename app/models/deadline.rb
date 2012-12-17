class Deadline < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :yearbook
end
