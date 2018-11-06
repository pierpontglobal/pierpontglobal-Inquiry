class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models do |t|
      t.references :maker, foreign_key: true
      t.string :year
      t.string :title

      t.timestamps
    end
  end
end
