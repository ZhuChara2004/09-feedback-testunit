class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :body, type: String
end
