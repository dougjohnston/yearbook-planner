class Page < ActiveRecord::Base
  include Assignable

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments
  
  has_one :spread
  belongs_to :deadline

  #validates :title, :presence => true, :unless => :blank?
  #validates :blank, :inclusion => { :in => [false] }, :if => :title?

  def blank?
    title.blank?
  end
end
