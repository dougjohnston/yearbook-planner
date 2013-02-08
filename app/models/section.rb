class Section < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include RankedModel
  include Assignable

  ranks :section_order

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :yearbook
  belongs_to :deadline
  has_many :spreads

  validates :yearbook, :title, :presence => true

  def to_params
    [section_order, sanitize(title)].join('-')
  end

  private
  def sanitize(str)
    str.downcase.gsub(/\W+/,'-')
  end
end
