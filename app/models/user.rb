class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :yearbooks
  #has_and_belongs_to_many :spreads
  has_many :assignments
  has_many :spreads, :through => :assignments, :source => :assignable, :source_type => 'Spread'
end
