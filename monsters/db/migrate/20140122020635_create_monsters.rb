class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :monster_type
      t.string :description

      t.timestamps
    end
  end
end
