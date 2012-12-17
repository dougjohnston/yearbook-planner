class Section < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :yearbook
  has_many :spreads
end
