class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Assignable

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :section
  belongs_to :deadline
  has_many :pages

  validates :title, :presence => true

  after_create :create_pages

  private
  def create_pages
    one = Page.create(:left => true)
    two = Page.create
    self.pages << [one,two]
  end
end
