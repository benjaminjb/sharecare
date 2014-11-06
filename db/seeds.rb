User.create([
  {
    email: 'samedietc@hotmail.com',
    firstname: 'Ben',
    lastname: 'Blattberg',
    password: '12341234', 
    password_confirmation: '12341234' 
  },
  {
    email: 'sarah.blattberg@gmail.com',
    firstname: 'Sarah',
    lastname: 'Blattberg',
    password: '12341234', 
    password_confirmation: '12341234'
  },
  {
    email: 'sarah.schmidt@gmail.com',
    firstname: 'Sarah',
    lastname: 'Schmidt',
    password: '12341234', 
    password_confirmation: '12341234'
  },
  {
    email: 'nick.mcdonough@yahoo.com',
    firstname: 'Nick',
    lastname: 'McDonough',
    password: '12341234', 
    password_confirmation: '12341234'
  },
  {
    email: 'Dad_Schmidt@aol.com',
    firstname: 'John',
    lastname: 'Schmidt',
    password: '12341234', 
    password_confirmation: '12341234'
  }
])

Team.create([
  {
    name: "Blackie Blattberg"
  },
  {
    name: "William Blattberg"
  },
  {
    name: "Mom"
  },
  {
    name: "Maple"
  }
])

Roster.create([
  {
    user_id: 1,
    team_id: 1
  },
  {
    user_id: 3,
    team_id: 1
  },
  {
    user_id: 2,
    team_id: 2
  },
  {
    user_id: 1,
    team_id: 2
  },
  {
    user_id: 3,
    team_id: 3
  },
  {
    user_id: 5,
    team_id: 3
  },
  {
    user_id: 4,
    team_id: 4
  }
])

Invitation.create([
  {
    email: 'samedietc@hotmail.com',
    team_id: 3
  },
  {
    email: 'nick.mcdonough@yahoo.com',
    team_id: 1
  }
])

Task.create([
  {
    team_id: 1, 
    task: "Morning walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 13th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 13th 2014 08:30:00 AM')
  },
  {
    team_id: 1, 
    user_id: 3,
    task: "Lunch walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 13th 2014 01:00:00 PM'),
    endtime: DateTime.parse('November 13th 2014 02:00:00 PM')
  },
  {
    team_id: 1, 
    task: "Dinner walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 13th 2014 07:00:00 PM'),
    endtime: DateTime.parse('November 13th 2014 08:00:00 PM')
  },
  {
    team_id: 1, 
    user_id: 3,
    task: "Monthly medicine",
    completed: true,
    notes: "",
    starttime: DateTime.parse('November 1st 2014 00:00:01 AM'),
    endtime: DateTime.parse('November 1st 2014 11:59:00 PM'),
    completed_at: DateTime.parse('November 1st 2014 12:01:00 PM')
  },
  {
    team_id: 1, 
    user_id: 1,
    task: "Monthly medicine",
    completed: false,
    notes: "",
    starttime: DateTime.parse('December 1st 2014 00:00:01 AM'),
    endtime: DateTime.parse('December 1st 2014 11:59:00 PM')
  },
  {
    team_id: 2, 
    task: "Educational birthday present",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 22nd 2013 00:01:00 AM'),
    endtime: DateTime.parse('November 21st 2014 11:59:00 PM') 
  },
  {
    team_id: 3, 
    user_id: 3,
    task: "Weekly call",
    completed: true,
    notes: "",
    starttime: DateTime.parse('November 2nd 2014 00:01:00 AM'),
    endtime: DateTime.parse('November 8th 2014 11:59:00 PM'),
    completed_at: DateTime.parse('November 8th 2014 07:00:00 PM')
  },
  {
    team_id: 3,
    user_id: 3, 
    task: "Weekly call",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 9th 2014 00:01:00 AM'),
    endtime: DateTime.parse('November 15th 2014 11:59:00 PM')
  },
  {
    team_id: 3, 
    user_id: 5,
    task: "Doctor visit",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 14th 2014 01:00:00 PM'),
    endtime: DateTime.parse('November 14th 2014 01:15:00 PM')
  },
  {
    team_id: 3, 
    user_id: 5,
    task: "Doctor visit",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 12th 2014 01:00:00 PM'),
    endtime: DateTime.parse('November 12th 2014 01:15:00 PM')
  },
  {
    team_id: 4, 
    user_id: 4,
    task: "Morning walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 13th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 13th 2014 08:30:00 AM')
  },
  {
    team_id: 4,
    user_id: 4, 
    task: "Lunch walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 13th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 13th 2014 08:30:00 AM')
  },
  {
    team_id: 4,
    user_id: 4, 
    task: "Evening walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 13th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 13th 2014 08:30:00 AM')
  },
  {
    team_id: 4, 
    task: "Morning walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 14th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 14th 2014 08:30:00 AM')
  },
  {
    team_id: 4, 
    task: "Lunch walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 14th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 14th 2014 08:30:00 AM')
  },
  {
    team_id: 4, 
    task: "Evening walk",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 14th 2014 08:00:00 AM'),
    endtime: DateTime.parse('November 14th 2014 08:30:00 AM')
  },
  {
    team_id: 4, 
    user_id: 4,
    task: "Monthly medicine",
    completed: false,
    notes: "",
    starttime: DateTime.parse('November 24th 2014 00:00:01 AM'),
    endtime: DateTime.parse('November 24th 2014 11:59:00 PM')
  }
])