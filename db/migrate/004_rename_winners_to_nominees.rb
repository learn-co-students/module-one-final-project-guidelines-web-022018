class RenameWinnersToNominees < ActiveRecord::Migration[4.2]
  def change
    rename_table(:winners, :nominees)
  end
end
