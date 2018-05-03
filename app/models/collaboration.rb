class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  validates :user_id, presence: true, uniqueness: {
    scope: :wiki_id,
    message: "can only be a collaborator on a wiki once."
  }
  validates :wiki_id, presence: true
end
