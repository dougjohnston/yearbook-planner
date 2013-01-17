module Assignable
  def assign_to(*users)
    self.users << users
  end

  def assigned?
    self.users.length > 0
  end

  def workers
    self.users
  end

  def number_of_workers
    self.users.length
  end
end
