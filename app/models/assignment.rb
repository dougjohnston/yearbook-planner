class Assignment < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end
