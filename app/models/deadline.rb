class Deadline < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :yearbook
  has_many :sections
  has_many :spreads
  has_many :pages
end
