class Jira::User < ApplicationRecord
  validates :url, :username, :password,
            presence: true
end
