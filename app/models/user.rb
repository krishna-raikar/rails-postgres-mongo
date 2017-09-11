class User < ApplicationRecord
  def status
    Status.where(user_id: self.id).order_by({created_at: -1}).one.status
  end

  def set_status(status)
    Status.create(user_id: self.id, status: status)
  end

  def statuses
    Status.where(user_id: self.id).order_by({created_at: -1})
  end
end
