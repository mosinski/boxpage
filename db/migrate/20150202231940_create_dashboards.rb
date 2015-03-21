class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.integer :user_id, null: false
      t.integer :background_type, null: false, default: 1
      t.string :background, null: false, default: '#ffffff'
      t.boolean :editable, null: false, default: true

      t.timestamps null: false
    end
  end
end
