class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :is_deleted, inclusion: { in: [true, false] }

  def active_for_authentification?
    super && (is_deleted == false)
  end

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

end
