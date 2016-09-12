class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.string :visibility, null: false, default: "public"
      t.string :status, null: false, default: "incomplete"
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :activities, :user_id

  end
end
