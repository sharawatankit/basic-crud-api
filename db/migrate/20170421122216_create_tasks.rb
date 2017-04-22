class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :todo ,index: true
      t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
