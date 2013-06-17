class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uun
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
