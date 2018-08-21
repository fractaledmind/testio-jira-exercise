class CreateJiraUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :jira_users do |t|
      t.string :url
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
