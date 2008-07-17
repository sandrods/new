class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.date :data
      t.boolean :salao, :pizza, :churras
      t.boolean :manha, :tarde, :noite
      t.integer :status, :user_id
      t.string :obs, :limit=>200

      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
