class UserPhone < ApplicationRecord
  belongs_to :user

  validates :number, presence: true

  before_create :generate_code

  def confirmed?
    code.nil?
  end

  private

  def generate_code
    self.code = rand(1000..9999)
  end
end
