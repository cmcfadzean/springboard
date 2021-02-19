class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :link
      t.references :vault, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
