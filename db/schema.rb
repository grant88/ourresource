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

ActiveRecord::Schema.define(:version => 20130111090827) do

  create_table "modes", :force => true do |t|
    t.time     "s_time"
    t.time     "f_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "procedures", :force => true do |t|
    t.string   "name"
    t.integer  "delay"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "procedures_specialists", :id => false, :force => true do |t|
    t.integer  "procedure_id"
    t.integer  "specialist_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "specialists", :force => true do |t|
    t.string   "fio"
    t.string   "login"
    t.string   "password"
    t.boolean  "admin"
    t.integer  "mode_id"
    t.integer  "room"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specialists_procedures", :id => false, :force => true do |t|
    t.integer  "procedure_id"
    t.integer  "specialist_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "timetables", :force => true do |t|
    t.integer  "specialist_id"
    t.integer  "procedure_id"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
