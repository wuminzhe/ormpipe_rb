class AddColumnsToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :oracle_assigned, :boolean, default: false
    add_column :messages, :oracle_relayed, :boolean, default: false
    add_column :messages, :relayer_assigned, :boolean, default: false
    add_column :messages, :relayer_relayed, :boolean, default: false
  end
end
