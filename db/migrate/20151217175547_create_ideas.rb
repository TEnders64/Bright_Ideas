class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user, index: true
      t.text :content

      t.timestamps
    end
  end
end
