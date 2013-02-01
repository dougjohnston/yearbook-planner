class Page < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Assignable

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments
  
  has_one :spread
  belongs_to :deadline

  validates :title, :presence => true, :unless => :blank_page?

  def blank_page?
    self.blank == true
  end
end
