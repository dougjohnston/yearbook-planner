class Event < ActiveRecord::Base
  include Assignable

  # Polymorphic association linking users through assignments
  has_many :assignments, :as => :assignable
  has_many :users, :through => :assignments

  belongs_to :yearbook
end
