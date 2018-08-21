class CreateJiraIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :jira_issues do |t|
      t.string :title
      t.text :description
      t.references :jira_project, foreign_key: true

      t.timestamps
    end
  end
end
