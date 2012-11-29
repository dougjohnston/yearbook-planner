class Yearbook < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  #attr_accessible :ending_year, :school, :starting_year, :theme, :title

  belongs_to :school
  has_many :sections
end
