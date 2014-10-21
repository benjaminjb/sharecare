# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CaredObject.create([
  {name: "Blackie"},
  {name: "Mom"}
  ])

User.create([
  {
    firstname: "Ben",
    lastname: "Blattberg",
    email: "samedietc@hotmail.com",
    phone: "516-835-9427"
  },
  {
    firstname: "Sarah",
    lastname: "Schmidt",
    email: "xyz@gmail.com",
    phone: "773-111-1111"
  },
  {
    firstname: "John",
    lastname: "Schmidt",
    email: "dad@gmail.com",
    phone: "312-222-2222"
  }
  ])

Team.create([
  {
    user_id: 1,
    cared_object_id: 1
  },
  {
    user_id: 2,
    cared_object_id: 1
  },
  {
    user_id: 2,
    cared_object_id: 2
  },
  {
    user_id: 3,
    cared_object_id: 2
  },
  ])

Task.create([
  {
    cared_object_id: 1,
    task: "Walk dog",
    completed: false,
    deadline: DateTime.new(20014,11,12,5)
  },
  {
    cared_object_id: 1,
    task: "Give flea meds",
    completed: false,
    deadline: DateTime.new(20014,12,1)
  },
  {
    cared_object_id: 2,
    task: "Weekly call",
    completed: false,
    deadline: DateTime.new(20014,11,14,20)
  },
  {
    cared_object_id: 1,
    task: "Buy crate",
    completed: false,
    claimed_id: 2
  }
])

Note.create([
  {
    cared_object_id: 1,
    user_id: 1,
    noted_at: DateTime.new(20014,10,1),
    remark: "Tore up headphones"
  },
  {
    cared_object_id: 1,
    user_id: 2,
    noted_at: DateTime.new(20014,10,1),
    remark: "Sleeping cute"
  },
  {
    cared_object_id: 2,
    user_id: 2,
    noted_at: DateTime.new(20014,11,12),
    remark: "Some note about mom"
  }
])
