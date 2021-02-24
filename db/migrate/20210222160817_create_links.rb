class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :original_url
      t.string :slug

      t.timestamps null: false
    end
  end
end
