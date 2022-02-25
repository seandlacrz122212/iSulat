class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.string :date
      t.text :notes

      t.timestamps
    end
  end
end
