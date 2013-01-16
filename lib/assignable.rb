module Assignable
  def assign_to(users)
    self.users << users
  end

  def assigned?
    return true
  end
end
