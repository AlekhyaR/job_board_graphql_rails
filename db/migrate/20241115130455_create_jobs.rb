class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :job_type
      t.string :location
      t.string :salary
      t.boolean :active

      t.timestamps
    end
  end
end
