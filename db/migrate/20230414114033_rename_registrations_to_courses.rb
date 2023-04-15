class RenameRegistrationsToCourses < ActiveRecord::Migration[7.0]
  def change
    rename_table :registrations, :courses
  end
end
