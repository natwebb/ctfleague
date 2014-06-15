class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :leagues
  has_many :memberships
  #has_many :leagues, through: :memberships

  validates :username, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "username can only contain letters and numbers" }
  validates_presence_of :email

  after_create :send_welcome_email

  def self.find_for_database_authentication(conditions={})
    self.where("username = ?", conditions[:email]).limit(1).first ||
    self.where("email = ?", conditions[:email]).limit(1).first
  end

  def to_param
    username
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
