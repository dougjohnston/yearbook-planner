class Event < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end
