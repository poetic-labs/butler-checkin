class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.text :details
      t.text :short_term_goal
      t.references :user
      t.boolean :complete
      t.boolean :missed
      t.date :month

      t.timestamps null: false
    end
  end
end
