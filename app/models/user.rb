class User < ActiveRecord::Base

  has_many :wikis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  after_initialize :init

  def init
    self.role ||= :standard
  end

  def downgrade_user
    self.role = :standard
  end

  def upgrade_user
    self.role = :premium
  end
  

  enum role: [:admin, :standard, :premium]

end
