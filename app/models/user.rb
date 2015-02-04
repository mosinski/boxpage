class User < ActiveRecord::Base
  attr_accessor :login
  has_one :dashboard
  after_create :create_dashboard

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, :uniqueness => {:case_sensitive => false}

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  private

  def create_dashboard
    Dashboard.create(user_id: self.id)
  end
end
