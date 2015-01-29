class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :downcase_email

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, length: { maximum: 254 }
  validates :body, length: { minimum: 10, maximum: 768 }

  field :name, type: String
  field :email, type: String
  field :body, type: String

  protected

  def downcase_email
    self.email = self.email.downcase
  end
end
