class Yearbook < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :school
  has_many :sections
end
