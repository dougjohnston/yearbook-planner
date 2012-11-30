class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :section
  has_many :pages
end
