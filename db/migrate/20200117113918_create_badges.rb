class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :img_name, null: false, default: 'star.svg'
      t.text :description

      t.timestamps
    end
  end
end
