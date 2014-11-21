class CreateNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|
        t.string :body
        t.integer :project_id

        t.timestamps
    end
  end
end
