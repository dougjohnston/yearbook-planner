class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :section
  has_many :pages
end
