# a
class User
  attr_accessor :id, :plan, :status, :use

  def initialize(id, plan, status, use)
    self.id = id
    self.plan = plan
    self.status = status
    self.use = use
  end
end
