class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.integer :proficiency_level
      t.timestamps
    end
  end
end
