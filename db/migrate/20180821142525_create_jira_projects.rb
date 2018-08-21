class CreateJiraProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :jira_projects do |t|
      t.references :jira_user, foreign_key: true

      t.timestamps
    end
  end
end
