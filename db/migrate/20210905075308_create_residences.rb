class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|

      t.timestamps
    end
  end
end
