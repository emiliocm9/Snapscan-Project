class User < ApplicationRecord
  has_secure_password
  attr_accessor :current_password
  validates :name, presence: true
  has_one_attached :avatar
  has_many :groups
  has_many :expenses

  def current_password_is_correct
    # Check if the user tried changing his/her password
    return if password.blank?

    # Get a reference to the user since the "authenticate" method always returns false when calling on itself.
    user = User.find_by_id(id)

    # Check if the user CANNOT be authenticated with the entered current password
    return unless user.authenticate(current_password) == false

    # Add an error stating that the current password is incorrect
    errors.add(:current_password, 'is incorrect.')
  end
end
