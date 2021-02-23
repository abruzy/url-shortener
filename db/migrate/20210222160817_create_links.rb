class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :url
      t.string :slug

      t.timestamps null: false
    end
  end
end
