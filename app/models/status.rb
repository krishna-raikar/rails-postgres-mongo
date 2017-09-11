class Status
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: Integer
  field :status, type: String


  def user
    User.find(self.user_id)
  end
end
