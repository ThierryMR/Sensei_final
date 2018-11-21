class CreateSenseis < ActiveRecord::Migration[5.2]
  def change
    create_table :senseis do |t|
      t.references :user, foreign_key: true
      t.float :avg_rating, array: true, default: []

      t.timestamps
    end
  end
end
