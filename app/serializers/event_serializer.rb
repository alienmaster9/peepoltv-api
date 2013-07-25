class EventSerializer < ActiveModel::Serializer
  attributes :id, :type, :created_at
  self.root = false

  has_one :stream
  has_one :user

  def type
    object.type_name
  end

  def created_at
    object.created_at.to_s(:api)
  end

end
