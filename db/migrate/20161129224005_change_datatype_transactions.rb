class ChangeDatatypeTransactions < ActiveRecord::Migration[5.0]
  def change

    change_column :transactions, :credit_card_number, :citext
    change_column :transactions, :result, :citext

  end
end
