class CreateGlasses < ActiveRecord::Migration[7.2]
  def change
    create_table :glasses do |t|
      t.string :name

      t.timestamps
    end
  end
end
