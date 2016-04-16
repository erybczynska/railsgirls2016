class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :name
      t.date :date
      t.string :city
      t.float :distance

      t.timestamps null: false
    end
  end
end
