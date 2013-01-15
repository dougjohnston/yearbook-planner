class Yearbook < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :school
  has_and_belongs_to_many :users
  has_many :sections

  before_create :make_first_yearbook_current

  def current!
    remove_all_current_flags
    self.reload.update_attribute(:current, true)
  end

  def make_first_yearbook_current
    self.current = true if school_yearbooks.empty?
  end

  def remove_all_current_flags
    school_yearbooks.update_all(:current => false)
  end

  def school_yearbooks
    Yearbook.where(:school_id => self.school_id).order('starting_year desc').reload
  end
end
