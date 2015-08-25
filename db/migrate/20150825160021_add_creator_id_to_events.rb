class AddCreatorIdToEvents < ActiveRecord::Migration
  def change
    add_foreign_key :events, :users, column: :creator_id
  end
end
