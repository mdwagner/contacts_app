class CreateContacts < Jennifer::Migration::Base
  def up
    create_table :contacts do |t|
      t.text :email, {:null => false}
      t.text :first
      t.text :last
      t.text :phone

      t.index :email, :unique

      t.timestamps
    end
  end

  def down
  end
end
