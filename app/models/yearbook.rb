class Yearbook < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :school
  has_and_belongs_to_many :users
  has_many :sections
end
