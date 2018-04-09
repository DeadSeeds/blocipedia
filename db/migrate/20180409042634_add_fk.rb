class AddFk < ActiveRecord::Migration
  def change
    add_foreign_key :wikis, :user, index: true
  end
end
