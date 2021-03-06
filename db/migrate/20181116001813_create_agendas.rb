class CreateAgendas < ActiveRecord::Migration[5.2]
  def change
    create_table :agendas do |t|
      t.references :sensei, foreign_key: true
      t.date :date
      t.integer :time, array: true, default: []

      t.timestamps
    end
  end
end
