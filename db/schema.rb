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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180603055112) do

  create_table "dinstructions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.string   "sijiname"
    t.text     "siji",       limit: 65535
    t.integer  "sijiflag"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "gotime"
    t.index ["patient_id"], name: "index_dinstructions_on_patient_id", using: :btree
  end

  create_table "dreports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.text     "drs",        limit: 65535
    t.text     "dro",        limit: 65535
    t.text     "dra",        limit: 65535
    t.text     "drp",        limit: 65535
    t.datetime "drt"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["patient_id"], name: "index_dreports_on_patient_id", using: :btree
  end

  create_table "enshus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "kisaibi"
    t.integer  "age"
    t.integer  "kiou"
    t.integer  "katudou"
    t.integer  "ninsiki"
    t.integer  "haisetu"
    t.integer  "med1"
    t.integer  "med2"
    t.integer  "med3"
    t.integer  "med4"
    t.integer  "med5"
    t.integer  "kankyo1"
    t.integer  "kankyo2"
    t.integer  "goukei"
    t.integer  "kikendo"
    t.string   "yobou"
    t.string   "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ereports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.text     "ers",        limit: 65535
    t.datetime "ert"
    t.string   "erm"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["patient_id"], name: "index_ereports_on_patient_id", using: :btree
  end

  create_table "kanris", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_kanris_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_kanris_on_reset_password_token", unique: true, using: :btree
  end

  create_table "kansatus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category"
    t.string   "ob_name"
    t.string   "n_1d"
    t.string   "j_1d"
    t.string   "s_2d"
    t.string   "n_2d"
    t.string   "j_2d"
    t.string   "s_3d"
    t.string   "n_3d"
    t.string   "j_3d"
    t.string   "s_4d"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_kansatus_on_patient_id", using: :btree
  end

  create_table "nreports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.text     "nrs",        limit: 65535
    t.text     "nro",        limit: 65535
    t.text     "nra",        limit: 65535
    t.text     "nrp",        limit: 65535
    t.datetime "nrt"
    t.integer  "nrn"
    t.string   "nrm"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["patient_id"], name: "index_nreports_on_patient_id", using: :btree
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "p_name"
    t.string   "p_kana"
    t.datetime "hos_date"
    t.string   "room_no"
    t.date     "birth_date"
    t.integer  "age"
    t.integer  "gender"
    t.string   "diagnosis"
    t.string   "med_history"
    t.integer  "bloodtype"
    t.float    "height",        limit: 24
    t.float    "weight",        limit: 24
    t.string   "infection"
    t.string   "allergic"
    t.integer  "aid"
    t.string   "attention"
    t.string   "post"
    t.string   "address"
    t.string   "wish"
    t.string   "notice"
    t.string   "recognition"
    t.string   "life"
    t.integer  "ps"
    t.integer  "hand_mmt"
    t.integer  "foot_mmt"
    t.string   "vision"
    t.string   "hearing"
    t.string   "verbal"
    t.string   "skin"
    t.string   "excretion"
    t.string   "iadl"
    t.string   "consciousness"
    t.string   "understanding"
    t.string   "keyp1"
    t.string   "connection"
    t.string   "family"
    t.string   "house"
    t.string   "impact"
    t.string   "relationship"
    t.string   "friend"
    t.string   "occupation"
    t.string   "position"
    t.string   "good_p"
    t.string   "bad_p"
    t.string   "value"
    t.string   "hobby"
    t.string   "anniversary"
    t.string   "fa_prob"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pdetails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "kubun"
    t.string   "naiyo"
    t.integer  "hyouka"
    t.date     "hyokad"
    t.integer  "plan_id"
    t.boolean  "availability"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["plan_id"], name: "index_pdetails_on_plan_id", using: :btree
  end

  create_table "plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.string   "name"
    t.date     "touroku"
    t.integer  "hyouka"
    t.date     "jikai"
    t.string   "konkyo"
    t.string   "sihyo_1"
    t.string   "sihyo_2"
    t.string   "sihyo_3"
    t.string   "kanren_1"
    t.string   "kanren_2"
    t.string   "kanren_3"
    t.string   "mokuhyo_1"
    t.string   "mokuhyo_2"
    t.string   "mokuhyo_3"
    t.string   "mokuhyo_4"
    t.string   "mokuhyo_5"
    t.integer  "mhyouka_1"
    t.integer  "mhyouka_2"
    t.integer  "mhyouka_3"
    t.integer  "mhyouka_4"
    t.integer  "mhyouka_5"
    t.date     "mhyoud_1"
    t.date     "mhyoud_2"
    t.date     "mhyoud_3"
    t.date     "mhyoud_4"
    t.date     "mhyoud_5"
    t.date     "hyokad"
    t.integer  "plno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_plans_on_patient_id", using: :btree
  end

  create_table "saiketus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "tori_day"
    t.string   "koumoku"
    t.float    "kekka",      limit: 24
    t.string   "kekka_m"
    t.float    "sita",       limit: 24
    t.float    "ue",         limit: 24
    t.string   "tani"
    t.integer  "patient_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["patient_id"], name: "index_saiketus_on_patient_id", using: :btree
  end

  create_table "tentous", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.date     "kisaibi"
    t.integer  "age"
    t.integer  "kiou"
    t.integer  "katudou"
    t.integer  "ninsiki"
    t.integer  "haisetu"
    t.integer  "med1"
    t.integer  "med2"
    t.integer  "med3"
    t.integer  "med4"
    t.integer  "med5"
    t.integer  "kankyo1"
    t.integer  "kankyo2"
    t.integer  "goukei"
    t.integer  "kikendo"
    t.string   "yobou"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_tentous_on_patient_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "section"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "dinstructions", "patients"
  add_foreign_key "dreports", "patients"
  add_foreign_key "ereports", "patients"
  add_foreign_key "kansatus", "patients"
  add_foreign_key "nreports", "patients"
  add_foreign_key "pdetails", "plans"
  add_foreign_key "plans", "patients"
  add_foreign_key "saiketus", "patients"
  add_foreign_key "tentous", "patients"
end
