class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :position

  belongs_to :section
  has_many :pages
end
