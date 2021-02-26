class CreateJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    create_table : do |t|
      t.string :jti, null: false
      t.datetime :expired_at, null: false
    end
  end
end
