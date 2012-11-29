class School < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :city, :country, :name, :state_province

  has_many :yearbooks
end
