# == Schema Information
#
# Table name: pug_oracle_set_dapis
#
#  id                  :bigint           not null, primary key
#  pug_evm_log_id      :bigint           not null
#  pug_evm_contract_id :bigint           not null
#  pug_network_id      :bigint           not null
#  chain_id            :decimal(78, )
#  dapi                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Pug::OracleSetDapi < ApplicationRecord
  belongs_to :pug_evm_log, class_name: 'Pug::EvmLog'
  alias evm_log pug_evm_log
  belongs_to :pug_evm_contract, class_name: 'Pug::EvmContract'
  alias evm_contract pug_evm_contract
  belongs_to :pug_network, class_name: 'Pug::Network'
  alias network pug_network
end
