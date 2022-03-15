class CreateUsrEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :usr_emails do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
