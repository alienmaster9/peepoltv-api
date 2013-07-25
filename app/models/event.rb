class Event < ActiveRecord::Base
  # Validations
  validates :user_id, :stream_id, presence: true

  # Relations
  belongs_to :user
  belongs_to :stream

  # Scopes
  scope :by_user, -> user_id { where(user_id: user_id)}


  # Returns the classname
  def type_name
    self.class.to_s.downcase
  end
end
