class Section < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :pages, :position, :title

  belongs_to :yearbook
  has_many :spreads
end
