class Yearbook < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :users
  has_many :sections
  has_many :deadlines

  before_create :make_first_yearbook_current

  validates :school, :starting_year, :ending_year, :presence => true
  validates :starting_year, :ending_year, :uniqueness => { :scope => :school_id }
  validates :starting_year, :ending_year, :numericality => true
  validates :starting_year, :ending_year, :numericality => { :greater_than => 2010, :less_than => 2025 }

  def years
    [starting_year, ending_year].join('-')
  end

  def title
    "#{years} &ndash; #{theme}".html_safe
  end

  def current!
    remove_all_current_flags
    self.reload.update_attribute(:current, true)
  end

  private
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
