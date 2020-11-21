class SetUsersDefaultBirthdateToToday < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :birthdate, :datetime, default: '01-01-2020'
  end

  def down
    change_column :users, :birthdate, :datetime, default: nil
  end
end
