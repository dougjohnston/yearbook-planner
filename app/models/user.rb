class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :yearbooks

  # Polymorphic association linking users through assignments
  has_many :assignments
  has_many :spreads, :through => :assignments, :source => :assignable, :source_type => 'Spread'
end
