class StreamPool < ActiveRecord::Base
  # Relations
  belongs_to :stream
  belongs_to :user

  # Validations
  validates :user_id, :stream_id, presence: true

  def set_active(active)
    return false unless stream.refresh_live_status

    # inactivate other streams
    inactivate_streams if active

    self.update_attributes active: active
    true
  end

  # removes the stream unless is active
  def remove_from_pool
    return false if self.active && self.user.stream_pools.count > 1

    self.destroy
    true
  end

  private
  # inactivates all the other streams
  def inactivate_streams
    StreamPool.update_all ['active = ?', false], ['user_id = ?', self.user_id]
  end
end
