class Deadline < ActiveRecord::Base
  belongs_to :yearbook
  has_many :sections
  has_many :spreads
  has_many :pages

  def sanitized_title
    sanitize self.title
  end

  def spreads_for(user)
    user.spreads.select { |s| s.deadline_id == self.id }
  end
  alias_method :spreads_for?, :spreads_for

  private
  def sanitize(str)
    str.downcase.gsub(/\W+/,'-')
  end
end
