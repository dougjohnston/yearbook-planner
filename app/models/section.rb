class Section < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Assignable

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :yearbook
  belongs_to :deadline
  has_many :spreads

  validates :yearbook, :title, :presence => true
end
