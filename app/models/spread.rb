class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_and_belongs_to_many :users
  belongs_to :section
  has_many :pages
end
