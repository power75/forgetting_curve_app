class AddPreferredNotificationMethodToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferred_notification_method, :integer, null: false, default: 0
  end
end
