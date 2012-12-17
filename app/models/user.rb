class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :school
  has_and_belongs_to_many :yearbooks

  # Polymorphic association linking users through assignments
  has_many :assignments
  has_many :sections, :through => :assignments, :source => :assignable, :source_type => 'Section'
  has_many :spreads, :through => :assignments, :source => :assignable, :source_type => 'Spread'
  has_many :pages, :through => :assignments, :source => :assignable, :source_type => 'Page'
  has_many :events, :through => :assignments, :source => :assignable, :source_type => 'Event'
end
