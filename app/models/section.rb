class Section < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :yearbook
  has_many :spreads
end
