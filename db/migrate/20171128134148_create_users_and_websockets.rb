class CreateUsersAndWebsockets < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    create_table :websockets do |t|
      t.string :host
      t.timestamps
    end

    create_table :users_websockets, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :websocket, index: true
    end
  end
end
