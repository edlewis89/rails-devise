class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.belongs_to :advertisement, index: { unique: true }, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
