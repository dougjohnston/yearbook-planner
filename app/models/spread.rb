class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  #has_and_belongs_to_many :users
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :section
  has_many :pages
end
