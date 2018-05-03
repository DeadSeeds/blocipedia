class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborations, dependent: :destroy
  has_many :collaborating_wikis, through: :collaborations, source: :wiki
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  after_initialize :init

  def init
    self.role ||= :standard
  end

  enum role: [:admin, :standard, :premium]

end
