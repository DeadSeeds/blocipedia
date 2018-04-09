class Wiki < ActiveRecord::Base
  belongs_to :user

  after_initialize { self.private = false }
end
