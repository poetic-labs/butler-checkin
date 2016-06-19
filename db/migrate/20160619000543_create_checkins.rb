class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.text :notes
      t.text :short_term_goal
      t.references :user

      t.timestamps null: false
    end
  end
end
