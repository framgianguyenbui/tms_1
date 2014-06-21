class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.integer :user_id
      t.integer :course_subject_id
      t.boolean :status

      t.timestamps
    end
  end
end
