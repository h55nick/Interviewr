# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130404163751) do
=======
ActiveRecord::Schema.define(:version => 20130404160240) do

  create_table "exercises", :force => true do |t|
    t.text     "question"
    t.integer  "difficulty"
    t.float    "rating"
    t.boolean  "is_public"
    t.string   "code"
    t.float    "cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "options", :force => true do |t|
    t.text     "answer"
    t.boolean  "is_correct"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end
>>>>>>> 18f8de1e78dd492bb2f1975049648a89f7e9b7a8

  create_table "people", :force => true do |t|
    t.string  "name"
    t.text    "address"
    t.string  "email"
    t.string  "password_digest"
    t.string  "phone"
    t.text    "image_file"
    t.float   "balance"
    t.float   "lat"
    t.float   "long"
    t.integer "customer_id"
  end

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
