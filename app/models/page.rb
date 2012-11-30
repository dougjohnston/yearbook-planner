class Page < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  belongs_to :spread
end
