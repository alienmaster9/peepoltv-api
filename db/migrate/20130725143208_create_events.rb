class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.references :stream
      t.string :type

      t.timestamps
    end
    add_index :events, :user_id
    add_index :events, :stream_id
  end
end
