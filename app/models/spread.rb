class Spread < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include RankedModel
  include Assignable

  ranks :spread_order

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :section
  belongs_to :deadline

  # Semantically, this doesn't make sense, but it seems to be required
  belongs_to :left_page, :class_name => "Page"
  belongs_to :right_page, :class_name => "Page"

  validates :title, :presence => true

  after_create :create_pages

  private
  def create_pages
    self.left_page = Page.create(:title => self.title)
    self.right_page = Page.create(:title => self.title)
    self.save!
  end
end
