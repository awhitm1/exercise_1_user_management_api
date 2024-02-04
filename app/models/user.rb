class User < ApplicationRecord
  validates :full_name, presence:true, uniqueness:true, length: { minimum: 3, maximum: 50}
  validates :email, presence:true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { minimum: 5, maximum: 255}
  validates :age, presence:true, numericality: { in: 18..100 }

  before_create :downcase_email

  def downcase_email
    self.email = email.downcase
  end
end
