class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.boolean :public
      t.text :text
      t.integer :creator_id, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :checkin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
