class School < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :users
  has_many :yearbooks

  def current_yearbook
    yearbooks
  end
end
