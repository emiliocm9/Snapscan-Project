class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :creator, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
