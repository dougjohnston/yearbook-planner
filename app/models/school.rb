class School < ActiveRecord::Base
  has_many :users
  has_many :yearbooks

  def current_yearbook
    yearbooks.where(:current => true).first
  end

  def newest_yearbook
    yearbooks.order('starting_year desc').first
  end

  def oldest_yearbook
    yearbooks.order('starting_year asc').first
  end
end
