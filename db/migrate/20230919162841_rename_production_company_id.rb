class RenameProductionCompanyId < ActiveRecord::Migration[7.0]
  change_table : do |t|
    t.remove :description, :name
    t.string :part_number
    t.index :part_number
    t.rename :upccode, :upc_code
  end

end
