class CreateCourseSubjectTasks < ActiveRecord::Migration
  def change
    create_table :course_subject_tasks do |t|
      t.integer :course_subject_id
      t.integer :task_id
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
