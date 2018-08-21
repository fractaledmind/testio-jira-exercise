class Jira::Issue < ApplicationRecord
  belongs_to :jira_project
end
