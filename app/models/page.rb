class Page < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :left, :page_number, :spread, :title
  
  belongs_to :spread
end
