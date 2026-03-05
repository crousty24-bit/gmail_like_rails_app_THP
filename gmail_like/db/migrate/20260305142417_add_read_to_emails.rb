class AddReadToEmails < ActiveRecord::Migration[8.0]
  def change
    add_column :emails, :read, :boolean, default: false #by default emails read is false(unread)
  end
end
