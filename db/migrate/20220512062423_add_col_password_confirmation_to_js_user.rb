class AddColPasswordConfirmationToJsUser < ActiveRecord::Migration[7.0]
  def change
    add_column :js_users, :password_confirmation, :string
  end
end
