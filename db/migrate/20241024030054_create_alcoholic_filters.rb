class CreateAlcoholicFilters < ActiveRecord::Migration[7.2]
  def change
    create_table :alcoholic_filters do |t|
      t.string :name

      t.timestamps
    end
  end
end
