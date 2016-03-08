class PostSerializer < ActiveModel::Serializer
  attributes :id, :date, :body
  has_one :author
end
